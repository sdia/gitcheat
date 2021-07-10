module Question exposing (Answer, Question, questionGenerator)

import Random


type QuestionType
    = Basic
    | Advanced


type alias Question =
    { question : String
    , hint : String
    , answers : Answers
    }


type alias Questions =
    List Question


type alias Answer =
    String


type alias Answers =
    List Answer


dumbQuestion =
    Question
        "who is the creator of git?"
        ""
        [ "Linus Torvalds" ]


questionGenerator : Questions -> Random.Generator Question
questionGenerator questions =
    Random.uniform dumbQuestion questions
