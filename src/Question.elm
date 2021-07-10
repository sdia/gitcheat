module Question exposing (Answer, Question)


type alias Question =
    { question : String
    , hint : String
    , answers : List Answer
    }


type alias Answer =
    String
