module DecoderTest exposing (suite)

import Expect exposing (..)
import Fixtures
import Json.Decode as Decode
import Mastodon.Decoder exposing (accountDecoder, customEmojiDecoder, filterDecoder, pollDecoder, statusDecoder)
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
        , describe "statusDecoder"
            [ test "decodes full status JSON" <|
                \_ ->
                    let
                        statusDecoded =
                            Decode.decodeString statusDecoder Fixtures.fullStatusJson
                    in
                    Expect.equal statusDecoded <| Ok Fixtures.fullStatus
            ]
        , describe "filterDecoder"
            [ test "decodes full filter JSON" <|
                \_ ->
                    let
                        filterDecoded =
                            Decode.decodeString filterDecoder Fixtures.fullFilterJson
                    in
                    Expect.equal filterDecoded <| Ok Fixtures.fullFilter
            ]
        , describe "pollDecoder"
            [ test "decodes full poll JSON" <|
                \_ ->
                    let
                        pollDecoded =
                            Decode.decodeString pollDecoder Fixtures.fullPollJson
                    in
                    Expect.equal pollDecoded <| Ok Fixtures.fullPoll
            ]
        ]
