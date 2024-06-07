module DecoderTest exposing (suite)

import Expect exposing (..)
import Fixtures
import Json.Decode as Decode
import Mastodon.Decoder exposing (accountDecoder, customEmojiDecoder)
import Test exposing (..)


suite : Test
suite =
    describe "The Decoder module"
        [ describe "customEmojiDecoder"
            [ test "decodes customEmoji JSON as expected" <|
                \_ ->
                    let
                        customEmojiDecoded =
                            Decode.decodeString customEmojiDecoder Fixtures.customEmojiJson
                    in
                    Expect.equal customEmojiDecoded <| Ok Fixtures.customEmoji
            , test "decodes customEmoji JSON with missing category as expected" <|
                \_ ->
                    let
                        customEmojiDecoded =
                            Decode.decodeString customEmojiDecoder Fixtures.customEmojiJsonMissingCategory
                    in
                    Expect.equal customEmojiDecoded <| Ok Fixtures.customEmojiMissingCategory
            ]
        , describe "accountDecoder"
            [ test "decodes full account JSON" <|
                \_ ->
                    let
                        accountDecoded =
                            Decode.decodeString accountDecoder Fixtures.fullAccountJson
                    in
                    Expect.equal accountDecoded <| Ok Fixtures.fullAccount
            ]
        ]
