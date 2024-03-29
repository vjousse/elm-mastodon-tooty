module Mastodon.ApiUrl exposing (account, accountTimeline, apps, block, blocks, context, favourite, favouriteTimeline, follow, followers, following, hashtag, homeTimeline, mute, mutes, notifications, oauthAuthorize, oauthToken, publicTimeline, reblog, relationships, search, searchAccount, source, status, statuses, streaming, unblock, unfavourite, unfollow, unmute, unreblog, updateMedia, uploadMedia, userAccount)

{-| Mastodon URLs


# Definition

@docs account, accountTimeline, apps, block, blocks, context, favourite, favouriteTimeline, follow, followers, following, hashtag, homeTimeline, mute, mutes, notifications, oauthAuthorize, oauthToken, publicTimeline, reblog, relationships, search, searchAccount, source, status, statuses, streaming, unblock, unfavourite, unfollow, unmute, unreblog, updateMedia, uploadMedia, userAccount

-}

import Mastodon.Model exposing (StatusId(..))


apiPrefix : String
apiPrefix =
    "/api/v1"


apiV2Prefix : String
apiV2Prefix =
    "/api/v2"


{-| apps
-}
apps : String
apps =
    apiPrefix ++ "/apps"


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


accounts : String
accounts =
    apiPrefix ++ "/accounts/"


{-| account
-}
account : String -> String
account id =
    accounts ++ id


{-| follow
-}
follow : String -> String
follow id =
    accounts ++ id ++ "/follow"


{-| unfollow
-}
unfollow : String -> String
unfollow id =
    accounts ++ id ++ "/unfollow"


{-| mute
-}
mute : String -> String
mute id =
    accounts ++ id ++ "/mute"


{-| unmute
-}
unmute : String -> String
unmute id =
    accounts ++ id ++ "/unmute"


{-| block
-}
block : String -> String
block id =
    accounts ++ id ++ "/block"


{-| unblock
-}
unblock : String -> String
unblock id =
    accounts ++ id ++ "/unblock"


{-| userAccount
-}
userAccount : String
userAccount =
    accounts ++ "verify_credentials"


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


{-| relationships
-}
relationships : String
relationships =
    accounts ++ "relationships"


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


{-| homeTimeline
-}
homeTimeline : String
homeTimeline =
    apiPrefix ++ "/timelines/home"


{-| publicTimeline
-}
publicTimeline : String
publicTimeline =
    apiPrefix ++ "/timelines/public"


{-| accountTimeline
-}
accountTimeline : String -> String
accountTimeline id =
    account id ++ "/statuses"


{-| favouriteTimeline
-}
favouriteTimeline : String
favouriteTimeline =
    apiPrefix ++ "/favourites"


{-| hashtag
-}
hashtag : String -> String
hashtag tag =
    apiPrefix ++ "/timelines/tag/" ++ tag


{-| mutes
-}
mutes : String
mutes =
    apiPrefix ++ "/mutes"


{-| blocks
-}
blocks : String
blocks =
    apiPrefix ++ "/blocks"


{-| notifications
-}
notifications : String
notifications =
    apiPrefix ++ "/notifications"


{-| statuses
-}
statuses : String
statuses =
    apiPrefix ++ "/statuses"


{-| context
-}
context : StatusId -> String
context (StatusId id) =
    statuses ++ "/" ++ id ++ "/context"


{-| reblog
-}
reblog : StatusId -> String
reblog (StatusId id) =
    statuses ++ "/" ++ id ++ "/reblog"


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


{-| favourite
-}
favourite : StatusId -> String
favourite (StatusId id) =
    statuses ++ "/" ++ id ++ "/favourite"


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
