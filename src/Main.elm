module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (keyCode, on, onClick, onInput)
import Json.Decode as Json
import Question exposing (Answer, Question, questionGenerator)
import QuestionsBasic exposing (questions)
import Random


type alias Model =
    { question : Maybe Question
    , feedback : String
    , current_answer : String
    , current_answer_status : AnswerStatus
    }


type Msg
    = NewQuestion Question
    | Answer String
    | Restart
    | Next


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


trac_progress_answer : Answer -> List Answer -> Bool
trac_progress_answer current_answer answers =
    List.any (String.startsWith current_answer) answers


initial_question : Maybe Question
initial_question =
    List.head questions


init : () -> ( Model, Cmd Msg )
init _ =
    let
        model =
            { question = initial_question
            , feedback = ""
            , current_answer = ""
            , current_answer_status = NotCorrect
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
              }
            , Cmd.none
            )

        Answer answer ->
            ( { model
                | current_answer = answer
                , current_answer_status = evaluate_answer model answer
              }
            , Cmd.none
            )

        Restart ->
            init ()


view : Model -> Html Msg
view model =
    case model.question of
        Just question ->
            div []
                [ div [] [ text question.question ]
                , viewInput "text" model question.hint model.current_answer question.answers Answer
                , button [ onClick Next ] [ text "next" ]
                , button [ onClick Restart ] [ text "restart" ]
                , viewValidation model
                ]

        Nothing ->
            div [] [ text "no questions today :(" ]


viewInput : String -> Model -> String -> String -> List Answer -> (String -> msg) -> Html msg
viewInput t model hint current_answer answers toMsg =
    let
        dStyle =
            let
                answer_status =
                    evaluate_answer model current_answer
            in
            case answer_status of
                Correct ->
                    style "color" "green"

                NotCorrect ->
                    if trac_progress_answer current_answer answers then
                        style "" ""

                    else
                        style "color" "red"
    in
    input
        [ type_ t
        , placeholder hint
        , value current_answer
        , onInput toMsg
        , dStyle
        ]
        []


viewValidation : Model -> Html msg
viewValidation model =
    case model.current_answer_status of
        Correct ->
            div [ style "color" "green" ] [ text "well done!" ]

        NotCorrect ->
            div [] []
