module Fixtures exposing (..)

import Mastodon.Model exposing (Account, CustomEmoji, Filter, FilterAction(..), FilterContext(..), MovedAccount(..), PreviewCardType(..), Status, StatusId(..))


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
  "group": false,
  "discoverable": true,
  "limited": true,
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
  ],
  "moved": {
  "id": "23634",
  "username": "noiob",
  "acct": "noiob@awoo.space",
  "display_name": "ikea shark fan account",
  "locked": false,
  "bot": false,
  "group": false,
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
}
}"""


fullAccount : Account
fullAccount =
    { acct = "noiob@awoo.space"
    , avatar = "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png"
    , avatar_static = "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png"
    , bot = False
    , created_at = "2017-02-08T02:00:53.274Z"
    , discoverable = Just True
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
    , fields =
        [ { name = "Pronouns"
          , value = "they/them"
          , verified_at = Nothing
          }
        , { name = "Alt"
          , value = "<span class=\"h-card\"><a href=\"https://cybre.space/@noiob\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>noiob</span}</span>"
          , verified_at = Nothing
          }
        , { name = "Bots"
          , value = "<span class=\"h-card\"><a href=\"https://botsin.space/@darksouls\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>darksouls</span}</span>, <span class=\"h-card\"><a href=\"https://botsin.space/@nierautomata\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>nierautomata</span}</span>, <span class=\"h-card\"><a href=\"https://mastodon.social/@fedi\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>fedi</span}</span>, code for <span class=\"h-card\"><a href=\"https://botsin.space/@awoobot\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>awoobot</span}</span>"
          , verified_at = Nothing
          }
        , { name = "Website"
          , value = "<a href=\"http://shork.xyz\" rel=\"nofollow noopener noreferrer\" target=\"_blank\"><span class=\"invisible\">http://</span><span class=\"\">shork.xyz</span><span class=\"invisible\"></span}"
          , verified_at = Just "2019-11-10T10:31:10.744+00:00"
          }
        ]
    , followers_count = 547
    , following_count = 404
    , group = False
    , header = "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png"
    , header_static = "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png"
    , id = "23634"
    , last_status_at = Just "2019-11-17"
    , limited = Just True
    , locked = False
    , moved =
        Just <|
            MovedAccount
                { acct = "noiob@awoo.space"
                , avatar = "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png"
                , avatar_static = "https://files.mastodon.social/accounts/avatars/000/023/634/original/6ca8804dc46800ad.png"
                , bot = False
                , created_at = "2017-02-08T02:00:53.274Z"
                , discoverable = Nothing
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
                , fields =
                    [ { name = "Pronouns"
                      , value = "they/them"
                      , verified_at = Nothing
                      }
                    , { name = "Alt"
                      , value = "<span class=\"h-card\"><a href=\"https://cybre.space/@noiob\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>noiob</span}</span>"
                      , verified_at = Nothing
                      }
                    , { name = "Bots"
                      , value = "<span class=\"h-card\"><a href=\"https://botsin.space/@darksouls\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>darksouls</span}</span>, <span class=\"h-card\"><a href=\"https://botsin.space/@nierautomata\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>nierautomata</span}</span>, <span class=\"h-card\"><a href=\"https://mastodon.social/@fedi\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>fedi</span}</span>, code for <span class=\"h-card\"><a href=\"https://botsin.space/@awoobot\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@<span>awoobot</span}</span>"
                      , verified_at = Nothing
                      }
                    , { name = "Website"
                      , value = "<a href=\"http://shork.xyz\" rel=\"nofollow noopener noreferrer\" target=\"_blank\"><span class=\"invisible\">http://</span><span class=\"\">shork.xyz</span><span class=\"invisible\"></span}"
                      , verified_at = Just "2019-11-10T10:31:10.744+00:00"
                      }
                    ]
                , followers_count = 547
                , following_count = 404
                , group = False
                , header = "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png"
                , header_static = "https://files.mastodon.social/accounts/headers/000/023/634/original/256eb8d7ac40f49a.png"
                , id = "23634"
                , last_status_at = Just "2019-11-17"
                , limited = Nothing
                , locked = False
                , moved = Nothing
                , mute_expires_at = Nothing
                , noindex = Nothing
                , note = """<p>:ms_rainbow_flag:\u{200B} :ms_bisexual_flagweb:\u{200B} :ms_nonbinary_flag:\u{200B} <a href="https://awoo.space/tags/awoo" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>awoo</span}.space <a href="https://awoo.space/tags/admin" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>admin</span} ~ <a href="https://awoo.space/tags/bi" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>bi</span} ~ <a href="https://awoo.space/tags/nonbinary" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>nonbinary</span} ~ compsci student ~ likes video <a href="https://awoo.space/tags/games" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>games</span} and weird/ old electronics and will post obsessively about both ~ avatar by <span class="h-card"><a href="https://weirder.earth/@dzuk" class="u-url mention" rel="nofollow noopener noreferrer" target="_blank">@<span>dzuk</span}</span></p>"""
                , statuses_count = 28468
                , suspended = Nothing
                , url = "https://awoo.space/@noiob"
                , username = "noiob"
                }
    , mute_expires_at = Nothing
    , noindex = Nothing
    , note = """<p>:ms_rainbow_flag:\u{200B} :ms_bisexual_flagweb:\u{200B} :ms_nonbinary_flag:\u{200B} <a href="https://awoo.space/tags/awoo" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>awoo</span}.space <a href="https://awoo.space/tags/admin" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>admin</span} ~ <a href="https://awoo.space/tags/bi" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>bi</span} ~ <a href="https://awoo.space/tags/nonbinary" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>nonbinary</span} ~ compsci student ~ likes video <a href="https://awoo.space/tags/games" class="mention hashtag" rel="nofollow noopener noreferrer" target="_blank">#<span>games</span} and weird/ old electronics and will post obsessively about both ~ avatar by <span class="h-card"><a href="https://weirder.earth/@dzuk" class="u-url mention" rel="nofollow noopener noreferrer" target="_blank">@<span>dzuk</span}</span></p>"""
    , statuses_count = 28468
    , suspended = Nothing
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


{-| <https://docs.joinmastodon.org/entities/Status/>
-}
fullStatusJson : String
fullStatusJson =
    """{
  "id": "103270115826048975",
  "created_at": "2019-12-08T03:48:33.901Z",
  "in_reply_to_id": null,
  "in_reply_to_account_id": null,
  "sensitive": false,
  "spoiler_text": "",
  "visibility": "public",
  "language": "en",
  "uri": "https://mastodon.social/users/Gargron/statuses/103270115826048975",
  "url": "https://mastodon.social/@Gargron/103270115826048975",
  "replies_count": 5,
  "reblogs_count": 6,
  "favourites_count": 11,
  "favourited": false,
  "reblogged": false,
  "muted": false,
  "bookmarked": false,
  "content": "<p>&quot;I lost my inheritance with one wrong digit on my sort code&quot;</p><p><a href=\\"https://www.theguardian.com/money/2019/dec/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code\\" rel=\\"nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">https://www.</span><span class=\\"ellipsis\\">theguardian.com/money/2019/dec</span><span class=\\"invisible\\">/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code</span}</p>",
  "reblog": null,
  "application": {
    "name": "Web",
    "website": null
  },
  "account": {
    "id": "1",
    "username": "Gargron",
    "acct": "Gargron",
    "display_name": "Eugen",
    "locked": false,
    "bot": false,
    "discoverable": true,
    "group": false,
    "created_at": "2016-03-16T14:34:26.392Z",
    "note": "<p>Developer of Mastodon and administrator of mastodon.social. I post service announcements, development updates, and personal stuff.</p>",
    "url": "https://mastodon.social/@Gargron",
    "avatar": "https://files.mastodon.social/accounts/avatars/000/000/001/original/d96d39a0abb45b92.jpg",
    "avatar_static": "https://files.mastodon.social/accounts/avatars/000/000/001/original/d96d39a0abb45b92.jpg",
    "header": "https://files.mastodon.social/accounts/headers/000/000/001/original/c91b871f294ea63e.png",
    "header_static": "https://files.mastodon.social/accounts/headers/000/000/001/original/c91b871f294ea63e.png",
    "followers_count": 322930,
    "following_count": 459,
    "statuses_count": 61323,
    "last_status_at": "2019-12-10T08:14:44.811Z",
    "emojis": [],
    "fields": [
      {
        "name": "Patreon",
        "value": "<a href=\\"https://www.patreon.com/mastodon\\" rel=\\"me nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">https://www.</span><span class=\\"\\">patreon.com/mastodon</span><span class=\\"invisible\\"></span>",
        "verified_at": null
      },
      {
        "name": "Homepage",
        "value": "<a href=\\"https://zeonfederated.com\\" rel=\\"me nofollow noopener noreferrer\\" target=\\"_blank\\"><span class=\\"invisible\\">https://</span><span class=\\"\\">zeonfederated.com</span><span class=\\"invisible\\"></span}",
        "verified_at": "2019-07-15T18:29:57.191+00:00"
      }
    ]
  },
  "media_attachments": [],
  "mentions": [],
  "tags": [],
  "emojis": [],
  "card": {
    "url": "https://www.theguardian.com/money/2019/dec/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code",
    "title": "‘I lost my £193,000 inheritance – with one wrong digit on my sort code’",
    "description": "When Peter Teich’s money went to another Barclays customer, the bank offered £25 as a token gesture",
    "type": "link",
    "author_name": "",
    "author_url": "",
    "provider_name": "",
    "provider_url": "",
    "html": "",
    "width": 0,
    "height": 0,
    "image": null,
    "embed_url": ""
  },
  "poll": null
}"""


fullStatus : Status
fullStatus =
    { account =
        { id = "1"
        , username = "Gargron"
        , acct = "Gargron"
        , display_name = "Eugen"
        , locked = False
        , bot = False
        , discoverable = Just True
        , group = False
        , created_at = "2016-03-16T14:34:26.392Z"
        , note = "<p>Developer of Mastodon and administrator of mastodon.social. I post service announcements, development updates, and personal stuff.</p>"
        , url = "https://mastodon.social/@Gargron"
        , avatar = "https://files.mastodon.social/accounts/avatars/000/000/001/original/d96d39a0abb45b92.jpg"
        , avatar_static = "https://files.mastodon.social/accounts/avatars/000/000/001/original/d96d39a0abb45b92.jpg"
        , header = "https://files.mastodon.social/accounts/headers/000/000/001/original/c91b871f294ea63e.png"
        , header_static = "https://files.mastodon.social/accounts/headers/000/000/001/original/c91b871f294ea63e.png"
        , followers_count = 322930
        , following_count = 459
        , statuses_count = 61323
        , last_status_at = Just "2019-12-10T08:14:44.811Z"
        , emojis = []
        , fields =
            [ { name = "Patreon"
              , value = "<a href=\"https://www.patreon.com/mastodon\" rel=\"me nofollow noopener noreferrer\" target=\"_blank\"><span class=\"invisible\">https://www.</span><span class=\"\">patreon.com/mastodon</span><span class=\"invisible\"></span>"
              , verified_at = Nothing
              }
            , { name = "Homepage"
              , value = "<a href=\"https://zeonfederated.com\" rel=\"me nofollow noopener noreferrer\" target=\"_blank\"><span class=\"invisible\">https://</span><span class=\"\">zeonfederated.com</span><span class=\"invisible\"></span}"
              , verified_at = Just "2019-07-15T18:29:57.191+00:00"
              }
            ]
        , limited = Nothing
        , moved = Nothing
        , mute_expires_at = Nothing
        , noindex = Nothing
        , suspended = Nothing
        }
    , application =
        Just
            { name = "Web"
            , website = Nothing
            }
    , bookmarked = Just False
    , card =
        Just
            { url = "https://www.theguardian.com/money/2019/dec/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code"
            , title = "‘I lost my £193,000 inheritance – with one wrong digit on my sort code’"
            , description = "When Peter Teich’s money went to another Barclays customer, the bank offered £25 as a token gesture"
            , type_ = Link
            , author_name = ""
            , author_url = ""
            , provider_name = ""
            , provider_url = ""
            , html = ""
            , width = 0
            , height = 0
            , image = Nothing
            , embed_url = ""
            , blurhash = Nothing
            , history = Nothing
            }
    , content = "<p>&quot;I lost my inheritance with one wrong digit on my sort code&quot;</p><p><a href=\"https://www.theguardian.com/money/2019/dec/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code\" rel=\"nofollow noopener noreferrer\" target=\"_blank\"><span class=\"invisible\">https://www.</span><span class=\"ellipsis\">theguardian.com/money/2019/dec</span><span class=\"invisible\">/07/i-lost-my-193000-inheritance-with-one-wrong-digit-on-my-sort-code</span}</p>"
    , created_at = "2019-12-08T03:48:33.901Z"
    , edited_at = Nothing
    , emojis = []
    , favourited = Just False
    , favourites_count = 11
    , filtered = Nothing
    , id = StatusId "103270115826048975"
    , in_reply_to_account_id = Nothing
    , in_reply_to_id = Nothing
    , language = Just "en"
    , media_attachments = []
    , mentions = []
    , muted = Just False
    , pinned = Nothing
    , poll = Nothing
    , reblog = Nothing
    , reblogged = Just False
    , reblogs_count = 6
    , replies_count = 5
    , sensitive = Just False
    , spoiler_text = ""
    , tags = []
    , text = Nothing
    , uri = "https://mastodon.social/users/Gargron/statuses/103270115826048975"
    , url = Just "https://mastodon.social/@Gargron/103270115826048975"
    , visibility = "public"
    }


fullFilterJson : String
fullFilterJson =
    """{
  "id": "19972",
  "title": "Test filter",
  "context": [
    "home"
  ],
  "expires_at": "2022-09-20T17:27:39.296Z",
  "filter_action": "warn",
  "keywords": [
    {
      "id": "1197",
      "keyword": "bad word",
      "whole_word": false
    }
  ],
  "statuses": [
    {
      "id": "1",
      "status_id": "109031743575371913"
    }
    ]
}"""


fullFilter : Filter
fullFilter =
    { context = [ HomeContext ]
    , id = "19972"
    , expires_at = Just "2022-09-20T17:27:39.296Z"
    , keywords =
        [ { id = "1197"
          , keyword = "bad word"
          , whole_word = False
          }
        ]
    , filter_action = WarnAction
    , statuses =
        [ { id = "1"
          , status_id = StatusId "109031743575371913"
          }
        ]
    , title = "Test filter"
    }
