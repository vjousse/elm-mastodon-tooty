module Fixtures exposing (..)

import Mastodon.Model exposing (CustomEmoji)


customEmoji : CustomEmoji
customEmoji =
    { shortcode = "blobaww"
    , url = "https://files.mastodon.social/custom_emojis/images/000/011/739/original/blobaww.png"
    , static_url = "https://files.mastodon.social/custom_emojis/images/000/011/739/static/blobaww.png"
    , visible_in_picker = True
    , category = Just "Blobs"
    }


{-| <https://docs.joinmastodon.org/entities/CustomEmoji/>
-}
customEmojiJson : String
customEmojiJson =
    """{
  "shortcode": "blobaww",
  "url": "https://files.mastodon.social/custom_emojis/images/000/011/739/original/blobaww.png",
  "static_url": "https://files.mastodon.social/custom_emojis/images/000/011/739/static/blobaww.png",
  "visible_in_picker": true,
  "category": "Blobs"
}"""
