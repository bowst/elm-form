module Form.Error exposing (Error, ErrorValue(..), value)

{-| Validation errors.

@docs Error, ErrorValue, value

-}

import Form.Tree as Tree exposing (Tree)


{-| Tree of errors.
-}
type alias Error e =
    Tree (ErrorValue e)


{-| A validation error. See `Form.Validate.customError` for `CustomError` building.
-}
type ErrorValue e
    = Empty
    | InvalidString
    | InvalidEmail
    | InvalidFormat
    | InvalidInt
    | InvalidFloat
    | InvalidBool
    | InvalidDate
    | SmallerIntThan Int
    | SmallerOrEqualIntThan Int
    | GreaterIntThan Int
    | GreaterOrEqualIntThan Int
    | SmallerFloatThan Float
    | SmallerOrEqualFloatThan Float
    | GreaterFloatThan Float
    | GreaterOrEqualFloatThan Float
    | ShorterStringThan Int
    | ShorterOrEqualStringThan Int
    | LongerStringThan Int
    | LongerOrEqualStringThan Int
    | NotIncludedIn
    | CustomError e


{-| Build a tree node (a leaf) for this error
-}
value : ErrorValue a -> Error a
value =
    Tree.Value
