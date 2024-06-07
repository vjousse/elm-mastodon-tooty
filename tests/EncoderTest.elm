module EncoderTest exposing (..)

import Expect exposing (..)
import Fixtures
import Json.Encode as Encode
import Mastodon.Encoder exposing (accountEncoder, customEmojiEncoder)
import Test exposing (..)


suite : Test
suite =
    describe "The Encoder module"
        [ describe "customEmojiEncode"
            [ test "encodes CustomEmoji into JSON as expected" <|
                \_ ->
                    let
                        customEmojiJsonEncoded =
                            Encode.encode 2 <| customEmojiEncoder Fixtures.customEmoji
                    in
                    Expect.equal customEmojiJsonEncoded Fixtures.customEmojiJson
            , test "encodes Account into JSON as expected" <|
                \_ ->
                    let
                        accountJsonEncoded =
                            Encode.encode 2 <| accountEncoder Fixtures.fullAccount
                    in
                    Expect.equal accountJsonEncoded Fixtures.accountJson
            ]
        ]
