module Fixtures exposing (..)

import Mastodon.Model exposing (Account, CustomEmoji)


customEmoji : CustomEmoji
customEmoji =
    { shortcode = "blobaww"
    , url = "https://files.mastodon.social/custom_emojis/images/000/011/739/original/blobaww.png"
    , static_url = "https://files.mastodon.social/custom_emojis/images/000/011/739/static/blobaww.png"
    , visible_in_picker = True
    , category = Just "Blobs"
    }


customEmojiMissingCategory : CustomEmoji
customEmojiMissingCategory =
    { shortcode = "blobaww"
    , url = "https://files.mastodon.social/custom_emojis/images/000/011/739/original/blobaww.png"
    , static_url = "https://files.mastodon.social/custom_emojis/images/000/011/739/static/blobaww.png"
    , visible_in_picker = True
    , category = Nothing
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


{-| <https://docs.joinmastodon.org/entities/CustomEmoji/>
-}
customEmojiJsonMissingCategory : String
customEmojiJsonMissingCategory =
    """{
  "shortcode": "blobaww",
  "url": "https://files.mastodon.social/custom_emojis/images/000/011/739/original/blobaww.png",
  "static_url": "https://files.mastodon.social/custom_emojis/images/000/011/739/static/blobaww.png",
  "visible_in_picker": true
}"""


{-| <https://docs.joinmastodon.org/entities/Account/>
-}
fullAccountJson : String
fullAccountJson =
    """{
  "id": "23634",
  "username": "noiob",
  "acct": "noiob@awoo.space",
  "display_name": "ikea shark fan account",
  "locked": false,
  "bot": false,
  "created_at": "2017-02-08T02:00:53.274Z",
  "note": "<p>:ms_rainbow_flag:\u{200B} :ms_bisexual_flagweb:\u{200B} :ms_nonbinary_flag:\u{200B} <a href=\\"https://awoo.space/tags/awoo\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>awoo</span}.space <a href=\\"https://awoo.space/tags/admin\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>admin</span} ~ <a href=\\"https://awoo.space/tags/bi\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>bi</span} ~ <a href=\\"https://awoo.space/tags/nonbinary\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>nonbinary</span} ~ compsci student ~ likes video <a href=\\"https://awoo.space/tags/games\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>games</span} and weird/ old electronics and will post obsessively about both ~ avatar by <span class=\\"h-card\\"><a href=\\"https://weirder.earth/@dzuk\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>dzuk</span}</span></p>",
  "url": "https://awoo.space/@noiob",
  "avatar": "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png",
  "avatar_static": "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png",
  "header": "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png",
  "header_static": "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png",
  "followers_count": 547,
  "following_count": 404,
  "statuses_count": 28468,
  "last_status_at": "2019-11-17",
  "emojis": [
    {
      "shortcode": "ms_rainbow_flag",
      "url": "https://files.mastodon.social/custom_emojis/images/000/028/691/original/6de008d6281f4f59.png",
      "static_url": "https://files.mastodon.social/custom_emojis/images/000/028/691/static/6de008d6281f4f59.png",
      "visible_in_picker": true
    },
    {
      "shortcode": "ms_bisexual_flag",
      "url": "https://files.mastodon.social/custom_emojis/images/000/050/744/original/02f94a5fca7eaf78.png",
      "static_url": "https://files.mastodon.social/custom_emojis/images/000/050/744/static/02f94a5fca7eaf78.png",
      "visible_in_picker": true
    },
    {
      "shortcode": "ms_nonbinary_flag",
      "url": "https://files.mastodon.social/custom_emojis/images/000/105/099/original/8106088bd4782072.png",
      "static_url": "https://files.mastodon.social/custom_emojis/images/000/105/099/static/8106088bd4782072.png",
      "visible_in_picker": true
    }
  ],
  "fields": [
    {
      "name": "Pronouns",
      "value": "they/them",
      "verified_at": null
    },
    {
      "name": "Alt",
      "value": "<span class=\\"h-card\\"><a href=\\"https://cybre.space/@noiob\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>noiob</span}</span>",
      "verified_at": null
    },
    {
      "name": "Bots",
      "value": "<span class=\\"h-card\\"><a href=\\"https://botsin.space/@darksouls\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>darksouls</span}</span>, <span class=\\"h-card\\"><a href=\\"https://botsin.space/@nierautomata\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>nierautomata</span}</span>, <span class=\\"h-card\\"><a href=\\"https://mastodon.social/@fedi\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>fedi</span}</span>, code for <span class=\\"h-card\\"><a href=\\"https://botsin.space/@awoobot\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>awoobot</span}</span>",
      "verified_at": null
    },
    {
      "name": "Website",
      "value": "<a href=\\"http://shork.xyz\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">http://</span><span class=\\"\\">shork.xyz</span><span class=\\"invisible\\"></span}",
      "verified_at": "2019-11-10T10:31:10.744+00:00"
    }
  ]
}"""


fullAccount : Account
fullAccount =
    { acct = "noiob@awoo.space"
    , avatar = "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png"
    , created_at = "2017-02-08T02:00:53.274Z"
    , emojis =
        [ { shortcode = "ms_rainbow_flag"
          , url = "https://files.mastodon.social/custom_emojis/images/000/028/691/original/6de008d6281f4f59.png"
          , static_url = "https://files.mastodon.social/custom_emojis/images/000/028/691/static/6de008d6281f4f59.png"
          , visible_in_picker = True
          , category = Nothing
          }
        , { shortcode = "ms_bisexual_flag"
          , url = "https://files.mastodon.social/custom_emojis/images/000/050/744/original/02f94a5fca7eaf78.png"
          , static_url = "https://files.mastodon.social/custom_emojis/images/000/050/744/static/02f94a5fca7eaf78.png"
          , visible_in_picker = True
          , category = Nothing
          }
        , { shortcode = "ms_nonbinary_flag"
          , url = "https://files.mastodon.social/custom_emojis/images/000/105/099/original/8106088bd4782072.png"
          , static_url = "https://files.mastodon.social/custom_emojis/images/000/105/099/static/8106088bd4782072.png"
          , visible_in_picker = True
          , category = Nothing
          }
        ]
    , display_name = "ikea shark fan account"
    , followers_count = 547
    , following_count = 404
    , header = "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png"
    , id = "23634"
    , locked = False
    , note = """<p>:ms_rainbow_flag:\u{200B} :ms_bisexual_flagweb:\u{200B} :ms_nonbinary_flag:\u{200B} <a href="https://awoo.space/tags/awoo" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>awoo</span}.space <a href="https://awoo.space/tags/admin" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>admin</span} ~ <a href="https://awoo.space/tags/bi" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>bi</span} ~ <a href="https://awoo.space/tags/nonbinary" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>nonbinary</span} ~ compsci student ~ likes video <a href="https://awoo.space/tags/games" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>games</span} and weird/ old electronics and will post obsessively about both ~ avatar by <span class="h-card"><a href="https://weirder.earth/@dzuk" class="u-url mention" rel="nofollow noopener noreferrer" target="_blank">@<span>dzuk</span}</span></p>"""
    , statuses_count = 28468
    , url = "https://awoo.space/@noiob"
    , username = "noiob"
    }


accountJson : String
accountJson =
    """{
  "acct": "noiob@awoo.space",
  "avatar": "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png",
  "created_at": "2017-02-08T02:00:53.274Z",
  "display_name": "ikea shark fan account",
  "emojis": [
    {
      "shortcode": "ms_rainbow_flag",
      "url": "https://files.mastodon.social/custom_emojis/images/000/028/691/original/6de008d6281f4f59.png",
      "static_url": "https://files.mastodon.social/custom_emojis/images/000/028/691/static/6de008d6281f4f59.png",
      "visible_in_picker": true,
      "category": null
    },
    {
      "shortcode": "ms_bisexual_flag",
      "url": "https://files.mastodon.social/custom_emojis/images/000/050/744/original/02f94a5fca7eaf78.png",
      "static_url": "https://files.mastodon.social/custom_emojis/images/000/050/744/static/02f94a5fca7eaf78.png",
      "visible_in_picker": true,
      "category": null
    },
    {
      "shortcode": "ms_nonbinary_flag",
      "url": "https://files.mastodon.social/custom_emojis/images/000/105/099/original/8106088bd4782072.png",
      "static_url": "https://files.mastodon.social/custom_emojis/images/000/105/099/static/8106088bd4782072.png",
      "visible_in_picker": true,
      "category": null
    }
  ],
  "followers_count": 547,
  "following_count": 404,
  "header": "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png",
  "id": "23634",
  "locked": false,
  "note": "<p>:ms_rainbow_flag:\u{200B} :ms_bisexual_flagweb:\u{200B} :ms_nonbinary_flag:\u{200B} <a href=\\"https://awoo.space/tags/awoo\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>awoo</span}.space <a href=\\"https://awoo.space/tags/admin\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>admin</span} ~ <a href=\\"https://awoo.space/tags/bi\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>bi</span} ~ <a href=\\"https://awoo.space/tags/nonbinary\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>nonbinary</span} ~ compsci student ~ likes video <a href=\\"https://awoo.space/tags/games\\" class=\\"mention hashtag\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">#<span>games</span} and weird/ old electronics and will post obsessively about both ~ avatar by <span class=\\"h-card\\"><a href=\\"https://weirder.earth/@dzuk\\" class=\\"u-url mention\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\">@<span>dzuk</span}</span></p>",
  "statuses_count": 28468,
  "url": "https://awoo.space/@noiob",
  "username": "noiob"
}"""
