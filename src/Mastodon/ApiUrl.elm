module Mastodon.ApiUrl exposing
    ( account, accountTimeline, apps, block, blocks, context, favourite, favouriteTimeline, follow, followers, following, hashtag, homeTimeline, mute, mutes, notifications, oauthAuthorize, oauthToken, publicTimeline, reblog, relationships, search, searchAccount, source, status, statuses, streaming, unblock, unfavourite, unfollow, unmute, unreblog, updateMedia, uploadMedia, userAccount
    , accounts, customEmojis
    )

{-| Mastodon URLs


# Definition

@docs account, accountTimeline, apps, block, blocks, context, favourite, favouriteTimeline, follow, followers, following, hashtag, homeTimeline, mute, mutes, notifications, oauthAuthorize, oauthToken, publicTimeline, reblog, relationships, search, searchAccount, source, status, statuses, streaming, unblock, unfavourite, unfollow, unmute, unreblog, updateMedia, uploadMedia, userAccount

-}

import Mastodon.Model exposing (StatusId(..))



-- Prefixes


apiPrefix : String
apiPrefix =
    "/api/v1"


apiV2Prefix : String
apiV2Prefix =
    "/api/v2"



-- Endpoints


{-| accounts
-}
accounts : String
accounts =
    apiPrefix ++ "/accounts/"


{-| account
-}
account : String -> String
account id =
    accounts ++ id


{-| accountTimeline
-}
accountTimeline : String -> String
accountTimeline id =
    account id ++ "/statuses"


{-| apps
-}
apps : String
apps =
    apiPrefix ++ "/apps"


{-| block
-}
block : String -> String
block id =
    accounts ++ id ++ "/block"


{-| blocks
-}
blocks : String
blocks =
    apiPrefix ++ "/blocks"


{-| context
-}
context : StatusId -> String
context (StatusId id) =
    statuses ++ "/" ++ id ++ "/context"


{-| customEmojis
-}
customEmojis : String
customEmojis =
    apiPrefix ++ "/custom_emojis"


{-| favourite
-}
favourite : StatusId -> String
favourite (StatusId id) =
    statuses ++ "/" ++ id ++ "/favourite"


{-| favouriteTimeline
-}
favouriteTimeline : String
favouriteTimeline =
    apiPrefix ++ "/favourites"


{-| follow
-}
follow : String -> String
follow id =
    accounts ++ id ++ "/follow"


{-| followers
-}
followers : String -> String
followers id =
    account id ++ "/followers"


{-| following
-}
following : String -> String
following id =
    account id ++ "/following"


{-| hashtag
-}
hashtag : String -> String
hashtag tag =
    apiPrefix ++ "/timelines/tag/" ++ tag


{-| homeTimeline
-}
homeTimeline : String
homeTimeline =
    apiPrefix ++ "/timelines/home"


{-| mute
-}
mute : String -> String
mute id =
    accounts ++ id ++ "/mute"


{-| mutes
-}
mutes : String
mutes =
    apiPrefix ++ "/mutes"


{-| notifications
-}
notifications : String
notifications =
    apiPrefix ++ "/notifications"


{-| oauthAuthorize
-}
oauthAuthorize : String
oauthAuthorize =
    "/oauth/authorize"


{-| oauthToken
-}
oauthToken : String
oauthToken =
    "/oauth/token"


{-| publicTimeline
-}
publicTimeline : String
publicTimeline =
    apiPrefix ++ "/timelines/public"


{-| reblog
-}
reblog : StatusId -> String
reblog (StatusId id) =
    statuses ++ "/" ++ id ++ "/reblog"


{-| relationships
-}
relationships : String
relationships =
    accounts ++ "relationships"


{-| search
-}
search : String
search =
    apiV2Prefix ++ "/search"


{-| searchAccount
-}
searchAccount : String
searchAccount =
    accounts ++ "search"


{-| status
-}
status : StatusId -> String
status (StatusId id) =
    statuses ++ "/" ++ id


{-| unreblog
-}
unreblog : StatusId -> String
unreblog (StatusId id) =
    statuses ++ "/" ++ id ++ "/unreblog"


{-| unfavourite
-}
unfavourite : StatusId -> String
unfavourite (StatusId id) =
    statuses ++ "/" ++ id ++ "/unfavourite"


{-| source

<https://docs.joinmastodon.org/methods/statuses/#source>

-}
source : StatusId -> String
source (StatusId id) =
    statuses ++ "/" ++ id ++ "/source"


{-| statuses
-}
statuses : String
statuses =
    apiPrefix ++ "/statuses"


{-| streaming
-}
streaming : String
streaming =
    apiPrefix ++ "/streaming/"


{-| updateMedia
-}
updateMedia : String -> String
updateMedia id =
    apiPrefix ++ "/media/" ++ id


{-| uploadMedia
-}
uploadMedia : String
uploadMedia =
    apiPrefix ++ "/media"


{-| unblock
-}
unblock : String -> String
unblock id =
    accounts ++ id ++ "/unblock"


{-| unfollow
-}
unfollow : String -> String
unfollow id =
    accounts ++ id ++ "/unfollow"


{-| unmute
-}
unmute : String -> String
unmute id =
    accounts ++ id ++ "/unmute"


{-| userAccount
-}
userAccount : String
userAccount =
    accounts ++ "verify_credentials"
