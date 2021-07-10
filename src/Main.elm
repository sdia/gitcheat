module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, button, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Question exposing (Answer, Question)
import QuestionsBasic exposing (questions)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- TYPE
-- type alias Question =
--     { question : String
--     , answers : List Answer
--     , hint : String
--     }
--
--
-- type alias Answer =
--     String


evaluate_answer : Answer -> List Answer -> Bool
evaluate_answer current_answer answers =
    if List.member current_answer answers then
        True

    else
        False


trac_progress_answer : Answer -> List Answer -> Bool
trac_progress_answer current_answer answers =
    -- String.startsWith  x y
    -- See if the second string starts with the first one.
    List.any (String.startsWith current_answer) answers


initial_question : Maybe Question
initial_question =
    List.head questions



--     Question
--         "How to commit"
--         "try this hint"
--         [ "git commit", "b", "c" ]
--
-- MODEL


type alias Model =
    { question : Maybe Question
    , feedback : String
    , current_answer : String
    }


init : Model
init =
    { question = initial_question
    , feedback = ""
    , current_answer = ""
    }



-- UPDATE


type Msg
    = NextQuestion
    | Answer String
    | Restart


update : Msg -> Model -> Model
update msg model =
    case msg of
        NextQuestion ->
            model

        Answer t ->
            { model | current_answer = t }

        Restart ->
            init



-- VIEW


view : Model -> Html Msg
view model =
    case model.question of
        Just question ->
            div []
                [ div [] [ text question.question ]
                , viewInput "text" model question.hint model.current_answer question.answers Answer
                , button [ onClick NextQuestion ] [ text "next" ]
                , button [ onClick Restart ] [ text "restart" ]
                , viewValidation model.current_answer question.answers
                ]

        Nothing ->
            div [] [ text "no questions today :(" ]


viewInput : String -> Model -> String -> String -> List Answer -> (String -> msg) -> Html msg
viewInput t model hint current_answer answers toMsg =
    let
        dStyle =
            if evaluate_answer current_answer answers then
                style "color" "green"

            else if trac_progress_answer current_answer answers then
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


viewValidation : Answer -> List Answer -> Html msg
viewValidation current_answer answers =
    if evaluate_answer current_answer answers then
        div [ style "color" "green" ] [ text "well done!" ]

    else
        -- div [ style "color" "red" ] [ text "Wrong answer!" ]
        div [] []
