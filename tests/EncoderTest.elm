module EncoderTest exposing (..)

import Expect exposing (..)
import Fixtures exposing (customEmoji, customEmojiJson)
import Json.Encode as Encode
import Mastodon.Encoder exposing (customEmojiEncoder)
import Test exposing (..)


suite : Test
suite =
    describe "The Encoder module"
        [ describe "customEmojiEncode"
            [ test "encodes CustomEmoji into JSON as expected" <|
                \_ ->
                    let
                        customEmojiJsonEncoded =
                            Encode.encode 2 <| customEmojiEncoder customEmoji
                    in
                    Expect.equal customEmojiJsonEncoded customEmojiJson
            ]
        ]
