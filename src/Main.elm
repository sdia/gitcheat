module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import ColorSummer exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Html.Events
import Json.Decode as Decode
import Question exposing (Answer, Question, questionGenerator)
import QuestionsBasic exposing (questions)
import Random


type alias Model =
    { question : Maybe Question
    , feedback : String
    , current_answer : String
    , current_answer_status : AnswerStatus
    , show_solution : Bool
    , next_question_enabled : Bool
    }


type Msg
    = NewQuestion Question
    | Answer String
    | Next
    | ShowSolution
    | EnterWasPressed


type AnswerStatus
    = Correct
    | NotCorrect


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


evaluate_answer : Model -> Answer -> AnswerStatus
evaluate_answer model answer =
    case model.question of
        Just question ->
            if List.member answer question.answers then
                Correct

            else
                NotCorrect

        Nothing ->
            NotCorrect


track_progress_answer : Answer -> List Answer -> Bool
track_progress_answer current_answer answers =
    List.any (String.startsWith current_answer) answers


init : () -> ( Model, Cmd Msg )
init _ =
    let
        model =
            { question = Nothing
            , feedback = ""
            , current_answer = ""
            , current_answer_status = NotCorrect
            , show_solution = False
            , next_question_enabled = False
            }
    in
    ( model
      -- , Cmd.none
    , Random.generate NewQuestion (questionGenerator questions)
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Next ->
            ( model
            , Random.generate NewQuestion (questionGenerator questions)
            )

        NewQuestion q ->
            ( { model
                | question = Just q
                , current_answer = ""
                , current_answer_status = NotCorrect
                , show_solution = False
                , next_question_enabled = False
              }
            , Cmd.none
            )

        Answer answer ->
            case model.current_answer_status of
                -- update model only if the answer is not correct
                NotCorrect ->
                    ( { model
                        | current_answer = answer
                        , current_answer_status = evaluate_answer model answer
                      }
                    , Cmd.none
                    )

                Correct ->
                    ( { model
                        | next_question_enabled = True
                      }
                    , Cmd.none
                    )

        ShowSolution ->
            ( { model
                | show_solution = True
                , next_question_enabled = True
              }
            , Cmd.none
            )

        EnterWasPressed ->
            if model.current_answer_status == Correct then
                ( model
                , Random.generate NewQuestion (questionGenerator questions)
                )

            else
                ( model, Cmd.none )


view : Model -> Html Msg
view model =
    layout [] <|
        column
            [ width fill
            , height fill
            , Font.family
                [ Font.typeface "IBM Plex Mono"
                , Font.monospace
                ]

            -- , explain Debug.todo
            ]
            [ navBar
            , bodyContent model
            , footerContent
            ]


navBar : Element msg
navBar =
    row [ width fill ] [ text "Git trainer" ]


bodyContent : Model -> Element Msg
bodyContent model =
    case model.question of
        Just question ->
            let
                make_button msg t clr =
                    Input.button
                        [ height fill
                        , Border.width 1
                        , Border.rounded 4
                        , paddingXY 20 0
                        , Background.color clr
                        , Font.color (rgb 1 1 1)
                        ]
                        { onPress = Just msg, label = text t }

                input_button_show_next =
                    if model.current_answer_status == Correct then
                        make_button Next "next >" teal

                    else if model.show_solution then
                        make_button Next "next >" teal

                    else
                        make_button ShowSolution "show" red
            in
            column [ width fill, height fill ]
                [ row
                    [ centerX
                    , centerY
                    , paddingXY 20 50
                    , Font.size 30
                    ]
                    [ question.question
                        |> capitalizeString
                        |> text
                    ]
                , row
                    [ centerX
                    , centerY
                    , padding 10
                    , width (px 750)
                    , spacing 20
                    ]
                    [ viewInput model question.hint model.current_answer question.answers Answer
                    , input_button_show_next
                    ]
                ]

        Nothing ->
            column [] [ text "no questions today :(" ]


footerContent : Element msg
footerContent =
    row [ width fill ] [ text "copyright sdia.pyc@gmail.com, 2021" ]


viewInput : Model -> String -> String -> List Answer -> (String -> Msg) -> Element Msg
viewInput model hint current_answer answers toMsg =
    let
        dStyle =
            let
                answer_status =
                    evaluate_answer model current_answer
            in
            case answer_status of
                Correct ->
                    Font.color green

                NotCorrect ->
                    if track_progress_answer current_answer answers then
                        Font.color gray_dark

                    else
                        Font.color red

        answer_to_show =
            if model.show_solution then
                case List.head answers of
                    Just answer ->
                        answer

                    Nothing ->
                        "could not find answer :("

            else
                current_answer
    in
    -- input
    Input.text
        [ dStyle
        , width fill
        , onEnter EnterWasPressed
        , centerX
        , Font.family
            [ Font.typeface "IBM Plex Mono"
            , Font.monospace
            ]
        , below
            (if model.current_answer_status == Correct then
                el
                    [ Font.color gray_light
                    , Font.size 15
                    , moveDown 10
                    ]
                    (text "excellent!, press enter to continue")

             else
                Element.none
            )
        ]
        { onChange = toMsg --\o -> toMsg o
        , text = answer_to_show
        , placeholder = Nothing --Maybe (Placeholder msg)
        , label = Input.labelHidden "label"
        }



--------------


onEnter : msg -> Element.Attribute msg
onEnter msg =
    Element.htmlAttribute
        (Html.Events.on "keyup"
            (Decode.field "key" Decode.string
                |> Decode.andThen
                    (\key ->
                        if key == "Enter" then
                            Decode.succeed msg

                        else
                            Decode.fail "Not the enter key"
                    )
            )
        )


capitalizeString : String -> String
capitalizeString s =
    let
        ts =
            String.trim s

        head_s =
            ts |> String.left 1 |> String.toUpper

        tail_s =
            String.dropLeft 1 ts
    in
    head_s ++ tail_s
