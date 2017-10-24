import Html exposing ( Html, Attribute, div, input, text, button, ul, li, p ) 
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL
    
type alias Model =
    {   
        ideas : List String,
        currentInput : String
    }

model : Model
model =
    { ideas = [],
    currentInput = "" }



-- UPDATE

type Msg
    = Add 
    | Change String

update : Msg -> Model -> Model
update msg model = 
    case msg of
        Add  ->
            { model | ideas = model.currentInput :: model.ideas}
        
        Change input ->
            { model | currentInput = input}

-- VIEW

view : Model -> Html Msg
view model = 
    div []
        [ input [ type_ "text", placeholder "Idea", onInput Change ] []
        , button [ onClick Add ] [ text "Add Idea" ] 
        , div [] [ text model.currentInput ]
        , div [] [ renderIdeas model.ideas ]
        ] 

renderIdea : String -> Html Msg
renderIdea idea = 
     [ div [] [ text idea ] ]
    

renderIdeas : List String -> Html Msg
renderIdeas ideas =
    List.map renderIdea ideas
