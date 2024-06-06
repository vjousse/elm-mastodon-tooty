module Decoder exposing (suite)

import Expect exposing (..)
import Fixtures exposing (customEmoji, customEmojiJson)
import Json.Decode as Decode
import Mastodon.Decoder exposing (customEmojiDecoder)
import Test exposing (..)


suite : Test
suite =
    describe "The Decoder module"
        [ describe "customEmojiDecoder"
            -- Nest as many descriptions as you like.
            [ test "decodes customEmoji JSON as expected" <|
                \_ ->
                    let
                        customEmojiDecoded =
                            Decode.decodeString customEmojiDecoder customEmojiJson
                    in
                    Expect.equal customEmojiDecoded <| Ok customEmoji
            ]
        ]
