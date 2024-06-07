module Mastodon.Encoder exposing (accountEncoder, appRegistrationEncoder, authorizationCodeEncoder, clientEncoder, customEmojiEncoder, mediaRequestBodyEncoder, registrationEncoder, statusEditRequestBodyEncoder, statusRequestBodyEncoder)

{-| Encode to the Mastodon json formats


# Definition

@docs accountEncoder, appRegistrationEncoder, authorizationCodeEncoder, clientEncoder, customEmojiEncoder, mediaRequestBodyEncoder, registrationEncoder, statusEditRequestBodyEncoder, statusRequestBodyEncoder

-}

import Json.Encode as Encode
import Mastodon.Model exposing (..)


encodeMaybe : (a -> Encode.Value) -> Maybe a -> Encode.Value
encodeMaybe encode thing =
    case thing of
        Nothing ->
            Encode.null

        Just value ->
            encode value


{-| appRegistrationEncoder
-}
appRegistrationEncoder : String -> String -> String -> String -> Encode.Value
appRegistrationEncoder client_name redirect_uris scope website =
    Encode.object
        [ ( "client_name", Encode.string client_name )
        , ( "redirect_uris", Encode.string redirect_uris )
        , ( "scopes", Encode.string scope )
        , ( "website", Encode.string website )
        ]


{-| authorizationCodeEncoder
-}
authorizationCodeEncoder : AppRegistration -> String -> Encode.Value
authorizationCodeEncoder registration authCode =
    Encode.object
        [ ( "client_id", Encode.string registration.client_id )
        , ( "client_secret", Encode.string registration.client_secret )
        , ( "grant_type", Encode.string "authorization_code" )
        , ( "redirect_uri", Encode.string registration.redirect_uri )
        , ( "code", Encode.string authCode )
        ]


{-| accountEncoder
-}
accountEncoder : Account -> Encode.Value
accountEncoder account =
    Encode.object
        [ ( "acct", Encode.string account.acct )
        , ( "avatar", Encode.string account.avatar )
        , ( "created_at", Encode.string account.created_at )
        , ( "display_name", Encode.string account.display_name )
        , ( "emojis", Encode.list customEmojiEncoder account.emojis )
        , ( "followers_count", Encode.int account.followers_count )
        , ( "following_count", Encode.int account.following_count )
        , ( "header", Encode.string account.header )
        , ( "id", Encode.string account.id )
        , ( "locked", Encode.bool account.locked )
        , ( "note", Encode.string account.note )
        , ( "statuses_count", Encode.int account.statuses_count )
        , ( "url", Encode.string account.url )
        , ( "username", Encode.string account.username )
        ]


{-| clientEncoder
-}
clientEncoder : Client -> Encode.Value
clientEncoder client =
    Encode.object
        [ ( "server", Encode.string client.server )
        , ( "token", Encode.string client.token )
        , ( "account", encodeMaybe accountEncoder client.account )
        ]


{-| mediaequestBodyEncoder
-}
mediaRequestBodyEncoder : MediaRequestBody -> Encode.Value
mediaRequestBodyEncoder mediaData =
    Encode.object
        [ ( "description", Encode.string mediaData.description )
        ]


{-| registrationEncoder
-}
registrationEncoder : AppRegistration -> Encode.Value
registrationEncoder registration =
    Encode.object
        [ ( "server", Encode.string registration.server )
        , ( "scope", Encode.string registration.scope )
        , ( "client_id", Encode.string registration.client_id )
        , ( "client_secret", Encode.string registration.client_secret )
        , ( "id", Encode.string registration.id )
        , ( "redirect_uri", Encode.string registration.redirect_uri )
        ]


encodeStatusId : StatusId -> Encode.Value
encodeStatusId (StatusId id) =
    Encode.string id


{-| statusRequestBodyEncoder
-}
statusRequestBodyEncoder : StatusRequestBody -> Encode.Value
statusRequestBodyEncoder statusData =
    Encode.object
        [ ( "status", Encode.string statusData.status )
        , ( "in_reply_to_id", encodeMaybe encodeStatusId statusData.in_reply_to_id )
        , ( "spoiler_text", encodeMaybe Encode.string statusData.spoiler_text )
        , ( "sensitive", Encode.bool statusData.sensitive )
        , ( "visibility", Encode.string statusData.visibility )
        , ( "media_ids", Encode.list Encode.string statusData.media_ids )
        ]


{-| statusEditRequestBodyEncoder
-}
statusEditRequestBodyEncoder : StatusEditRequestBody -> Encode.Value
statusEditRequestBodyEncoder statusData =
    Encode.object
        [ ( "status", Encode.string statusData.status )
        , ( "spoiler_text", encodeMaybe Encode.string statusData.spoiler_text )
        , ( "sensitive", Encode.bool statusData.sensitive )
        , ( "media_ids", Encode.list Encode.string statusData.media_ids )
        ]


{-| customEmojiEncoder
-}
customEmojiEncoder : CustomEmoji -> Encode.Value
customEmojiEncoder customEmoji =
    Encode.object
        [ ( "shortcode", Encode.string customEmoji.shortcode )
        , ( "url", Encode.string customEmoji.url )
        , ( "static_url", Encode.string customEmoji.static_url )
        , ( "visible_in_picker", Encode.bool customEmoji.visible_in_picker )
        , ( "category", encodeMaybe Encode.string customEmoji.category )
        ]
