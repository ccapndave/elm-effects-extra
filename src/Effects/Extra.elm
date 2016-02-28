module Effects.Extra where

{-| Convenience functions for working with effects in Elm

@docs pipeUpdate
-}

import Effects exposing (Effects)

{-| A function allowing you to compose calls to update.  Most useful when used
in its infix form to make update pipeline.

    import Effects.Extra.Infix exposing ((:>))

    update : Action -> Model -> (Model, Effects Action)
    update action model =
      ComposedAction ->
        (model, Effects.none)
          :> update AnotherAction
          :> update YetAnotherAction
          :> update SubComponent.SomeAction

-}
pipeUpdate : (m, Effects a) -> (m -> (m, Effects a)) -> (m, Effects a)
pipeUpdate (model, effects) f =
  let
    (model', effects') = f model
  in
  (model', Effects.batch [ effects', effects ])
