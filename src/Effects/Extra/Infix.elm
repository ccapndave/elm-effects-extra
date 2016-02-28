module Effects.Extra.Infix where

{-| Infix versions of functions in Effects.Extra

@docs (:>)
-}

import Effects exposing (Effects)
import Effects.Extra exposing (pipeUpdate)

{-| An infix version of Effects.Extra.pipeUpdate.  Easy to remember because the
colon in the symbol represents piping two things through the chain (model and effects!).
-}
(:>) : (m, Effects a) -> (m -> (m, Effects a)) -> (m, Effects a)
(:>) = pipeUpdate

infixl 0 :>
