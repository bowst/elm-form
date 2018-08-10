module Form.Validate.Pipeline exposing (validate, with)

{-|


# Form.Validate.Pipeline


Use the `(|>)` operator to build Form validators.  Heavily inspired by the wonderful [Json.Decode.Pipeline](http://package.elm-lang.org/packages/NoRedInk/elm-decode-pipeline/latest) package.


## Validating fields


@docs with


## Beginning pipelines


@docs decode


-}

import Form.Validate exposing (Validation, map2, field, succeed)


{-| Begin a validation pipeline. This is a synonym for [Form.Validate.succeed](http://package.elm-lang.org/packages/bowst/elm-form/1.0.0/Form-Validate#succeed),
intended to make things read more clearly.

    import Form.Validate exposing (Validation, string, int)
    import Form.Validate.Pipeline exposing (validate, with)

    type alias User =
        { id : Int
        , name : String
        , email : String
        }

    validateUser : Validation () User
    validateUser =
        validate User
            |> with "id" int
            |> with "name" string
            |> with "email" string
-}
validate : a -> Validation e a
validate =
    succeed


{-| Validate a field.
-}
with : String -> Validation e a -> Validation e (a -> b) -> Validation e b
with key validator wrapped =
    map2 (<|) wrapped (field key validator)
