module Mastodon.Decoder exposing (accessTokenDecoder, accountDecoder, appRegistrationDecoder, attachmentDecoder, contextDecoder, customEmojiDecoder, decodeClients, decodeWebSocketMessage, mastodonErrorDecoder, mentionDecoder, notificationDecoder, reblogDecoder, relationshipDecoder, searchResultsDecoder, statusDecoder, statusSourceDecoder, tagDecoder, webSocketEventDecoder, filterDecoder)

{-| Decode from Mastodon json into Data


# Definition

@docs accessTokenDecoder, accountDecoder, appRegistrationDecoder, attachmentDecoder, contextDecoder, customEmojiDecoder, decodeClients, decodeWebSocketMessage, mastodonErrorDecoder, mentionDecoder, notificationDecoder, reblogDecoder, relationshipDecoder, searchResultsDecoder, statusDecoder, statusSourceDecoder, tagDecoder, webSocketEventDecoder, filterDecoder

-}

import Json.Decode as Decode
import Json.Decode.Pipeline as Pipe
import Mastodon.Model exposing (..)
import Mastodon.WebSocket exposing (..)


{-| appRegistrationDecoder
-}
appRegistrationDecoder : String -> String -> Decode.Decoder AppRegistration
appRegistrationDecoder server scope =
    Decode.succeed AppRegistration
        |> Pipe.hardcoded server
        |> Pipe.hardcoded scope
        |> Pipe.required "client_id" Decode.string
        |> Pipe.required "client_secret" Decode.string
        |> Pipe.required "id" idDecoder
        |> Pipe.required "redirect_uri" Decode.string


{-| accessTokenDecoder
-}
accessTokenDecoder : AppRegistration -> Decode.Decoder AccessTokenResult
accessTokenDecoder registration =
    Decode.succeed AccessTokenResult
        |> Pipe.hardcoded registration.server
        |> Pipe.required "access_token" Decode.string


{-| accountDecoder
-}
accountDecoder : Decode.Decoder Account
accountDecoder =
    Decode.succeed Account
        |> Pipe.required "acct" Decode.string
        |> Pipe.required "avatar" Decode.string
        |> Pipe.required "avatar_static" Decode.string
        |> Pipe.required "bot" Decode.bool
        |> Pipe.required "created_at" Decode.string
        |> Pipe.optional "discoverable" (Decode.nullable Decode.bool) Nothing
        |> Pipe.required "emojis" (Decode.list customEmojiDecoder)
        |> Pipe.required "display_name" Decode.string
        |> Pipe.required "fields" (Decode.list accountFieldDecoder)
        |> Pipe.required "followers_count" Decode.int
        |> Pipe.required "following_count" Decode.int
        |> Pipe.required "group" Decode.bool
        |> Pipe.required "header" Decode.string
        |> Pipe.required "header_static" Decode.string
        |> Pipe.required "id" idDecoder
        |> Pipe.optional "last_status_at" (Decode.nullable Decode.string) Nothing
        |> Pipe.optional "limited" (Decode.nullable Decode.bool) Nothing
        |> Pipe.required "locked" Decode.bool
        |> Pipe.optional "moved" (Decode.nullable (Decode.map MovedAccount (Decode.lazy (\_ -> accountDecoder)))) Nothing
        |> Pipe.optional "mute_expires_at" (Decode.nullable Decode.string) Nothing
        |> Pipe.optional "noindex" (Decode.nullable Decode.bool) Nothing
        |> Pipe.required "note" Decode.string
        |> Pipe.required "statuses_count" Decode.int
        |> Pipe.optional "suspended" (Decode.nullable Decode.bool) Nothing
        |> Pipe.required "url" Decode.string
        |> Pipe.required "username" Decode.string


{-| accountFieldDecoder
-}
accountFieldDecoder : Decode.Decoder AccountField
accountFieldDecoder =
    Decode.succeed AccountField
        |> Pipe.required "name" Decode.string
        |> Pipe.required "value" Decode.string
        |> Pipe.required "verified_at" (Decode.nullable Decode.string)


applicationDecoder : Decode.Decoder Application
applicationDecoder =
    Decode.succeed Application
        |> Pipe.required "name" Decode.string
        |> Pipe.required "website" (Decode.nullable Decode.string)


{-| attachmentDecoder
-}
attachmentDecoder : Decode.Decoder Attachment
attachmentDecoder =
    Decode.succeed Attachment
        |> Pipe.required "id" idDecoder
        |> Pipe.required "type" Decode.string
        |> Pipe.required "url" Decode.string
        |> Pipe.optional "remote_url" (Decode.nullable Decode.string) Nothing
        |> Pipe.required "preview_url" (Decode.nullable Decode.string)
        |> Pipe.required "text_url" (Decode.nullable Decode.string)
        |> Pipe.required "description" (Decode.nullable Decode.string)


{-| contextDecoder
-}
contextDecoder : Decode.Decoder Context
contextDecoder =
    Decode.succeed Context
        |> Pipe.required "ancestors" (Decode.list statusDecoder)
        |> Pipe.required "descendants" (Decode.list statusDecoder)


clientDecoder : Decode.Decoder Client
clientDecoder =
    Decode.succeed Client
        |> Pipe.required "server" Decode.string
        |> Pipe.required "token" Decode.string
        |> Pipe.required "account" (Decode.maybe accountDecoder)


{-| decodeClients
-}
decodeClients : String -> Result Decode.Error (List Client)
decodeClients json =
    Decode.decodeString (Decode.list clientDecoder) json


{-| filterDecoder
-}
filterDecoder : Decode.Decoder Filter
filterDecoder =
    Decode.succeed Filter
        |> Pipe.required "context"
            (Decode.list
                (Decode.string
                    |> Decode.andThen
                        (\str ->
                            case str of
                                "home" ->
                                    Decode.succeed HomeContext

                                "notifications" ->
                                    Decode.succeed NotificationsContext

                                "public" ->
                                    Decode.succeed PublicContext

                                "thread" ->
                                    Decode.succeed ThreadContext

                                "account" ->
                                    Decode.succeed AccountContext

                                _ ->
                                    Decode.fail "Invalid Filter context"
                        )
                )
            )
        |> Pipe.required "id" Decode.string
        |> Pipe.optional "expires_at" (Decode.nullable Decode.string) Nothing
        |> Pipe.required "keywords" (Decode.list filterKeywordDecoder)
        |> Pipe.required "filter_action"
            (Decode.string
                |> Decode.andThen
                    (\str ->
                        case str of
                            "warn" ->
                                Decode.succeed WarnAction

                            "hide" ->
                                Decode.succeed HideAction

                            _ ->
                                Decode.fail "Invalid filter action"
                    )
            )
        |> Pipe.required "statuses" (Decode.list filterStatusDecoder)
        |> Pipe.required "title" Decode.string


{-| filterKeywordDecoder
-}
filterKeywordDecoder : Decode.Decoder FilterKeyword
filterKeywordDecoder =
    Decode.succeed FilterKeyword
        |> Pipe.required "id" Decode.string
        |> Pipe.required "keyword" Decode.string
        |> Pipe.required "whole_word" Decode.bool


{-| filterResultDecoder
-}
filterResultDecoder : Decode.Decoder FilterResult
filterResultDecoder =
    Decode.succeed FilterResult
        |> Pipe.required "filter" filterDecoder
        |> Pipe.optional "keyword_matches" (Decode.nullable (Decode.list Decode.string)) Nothing
        |> Pipe.optional "status_matches" (Decode.nullable (Decode.list statusIdDecoder)) Nothing


{-| filterStatusDecoder
-}
filterStatusDecoder : Decode.Decoder FilterStatus
filterStatusDecoder =
    Decode.succeed FilterStatus
        |> Pipe.required "id" Decode.string
        |> Pipe.required "status_id" statusIdDecoder


{-| mastodonErrorDecoder
-}
mastodonErrorDecoder : Decode.Decoder String
mastodonErrorDecoder =
    Decode.field "error" Decode.string


{-| mentionDecoder
-}
mentionDecoder : Decode.Decoder Mention
mentionDecoder =
    Decode.succeed Mention
        |> Pipe.required "id" idDecoder
        |> Pipe.required "url" Decode.string
        |> Pipe.required "username" Decode.string
        |> Pipe.required "acct" Decode.string


{-| notificationDecoder
-}
notificationDecoder : Decode.Decoder Notification
notificationDecoder =
    Decode.succeed Notification
        |> Pipe.required "id" idDecoder
        |> Pipe.required "type" Decode.string
        |> Pipe.required "created_at" Decode.string
        |> Pipe.required "account" accountDecoder
        |> Pipe.optional "status" (Decode.nullable statusDecoder) Nothing


{-| pollDecoder
-}
pollDecoder : Decode.Decoder Poll
pollDecoder =
    Decode.succeed Poll
        |> Pipe.required "id" idDecoder
        |> Pipe.required "emojis" (Decode.list customEmojiDecoder)
        |> Pipe.required "expired" Decode.bool
        |> Pipe.optional "expires_at" (Decode.nullable Decode.string) Nothing
        |> Pipe.required "multiple" Decode.bool
        |> Pipe.required "options" (Decode.list pollOptionDecoder)
        |> Pipe.required "own_votes" (Decode.list Decode.int)
        |> Pipe.required "vote_counts" Decode.int
        |> Pipe.optional "voter_counts" (Decode.nullable Decode.int) Nothing
        |> Pipe.optional "voted" (Decode.nullable Decode.bool) Nothing


{-| pollOptionDecoder
-}
pollOptionDecoder : Decode.Decoder PollOption
pollOptionDecoder =
    Decode.succeed PollOption
        |> Pipe.required "title" Decode.string
        |> Pipe.optional "votes_count" (Decode.nullable Decode.int) Nothing


{-| previewCardDecoder
-}
previewCardDecoder : Decode.Decoder PreviewCard
previewCardDecoder =
    Decode.succeed PreviewCard
        |> Pipe.required "author_name" Decode.string
        |> Pipe.required "author_url" Decode.string
        |> Pipe.optional "blurhash" (Decode.nullable Decode.string) Nothing
        |> Pipe.required "description" Decode.string
        |> Pipe.required "embed_url" Decode.string
        |> Pipe.required "height" Decode.int
        |> Pipe.optional "history" (Decode.nullable (Decode.list previewCardHistoryDecoder)) Nothing
        |> Pipe.required "html" Decode.string
        |> Pipe.optional "image" (Decode.nullable Decode.string) Nothing
        |> Pipe.required "provider_name" Decode.string
        |> Pipe.required "provider_url" Decode.string
        |> Pipe.required "title" Decode.string
        |> Pipe.required "type"
            (Decode.string
                |> Decode.andThen
                    (\str ->
                        case str of
                            "link" ->
                                Decode.succeed Link

                            "photo" ->
                                Decode.succeed Photo

                            "video" ->
                                Decode.succeed Video

                            "rich" ->
                                Decode.succeed Rich

                            _ ->
                                Decode.fail "Invalid PreviewCardType"
                    )
            )
        |> Pipe.required "url" Decode.string
        |> Pipe.required "width" Decode.int


{-| previewCardHistoryDecoder
-}
previewCardHistoryDecoder : Decode.Decoder PreviewCardHistory
previewCardHistoryDecoder =
    Decode.succeed PreviewCardHistory
        |> Pipe.required "accounts" Decode.string
        |> Pipe.required "day" Decode.string
        |> Pipe.required "uses" Decode.string


{-| relationshipDecoder
-}
relationshipDecoder : Decode.Decoder Relationship
relationshipDecoder =
    Decode.succeed Relationship
        |> Pipe.required "id" idDecoder
        |> Pipe.required "blocking" Decode.bool
        |> Pipe.required "followed_by" Decode.bool
        |> Pipe.required "following" Decode.bool
        |> Pipe.required "muting" Decode.bool
        |> Pipe.required "requested" Decode.bool


{-| tagDecoder
-}
tagDecoder : Decode.Decoder Tag
tagDecoder =
    Decode.succeed Tag
        |> Pipe.required "name" Decode.string
        |> Pipe.required "url" Decode.string


{-| reblogDecoder
-}
reblogDecoder : Decode.Decoder Reblog
reblogDecoder =
    Decode.map Reblog (Decode.lazy (\_ -> statusDecoder))


{-| searchResultsDecoder
-}
searchResultsDecoder : Decode.Decoder SearchResults
searchResultsDecoder =
    Decode.succeed SearchResults
        |> Pipe.required "accounts" (Decode.list accountDecoder)
        |> Pipe.required "statuses" (Decode.list statusDecoder)
        |> Pipe.required "hashtags" (Decode.list hashtagDecoder)


idDecoder : Decode.Decoder String
idDecoder =
    -- Note: since v2.0.0 of the Mastodon API, ids are treated as strings, so we
    -- treat all ids as strings.
    Decode.oneOf
        [ Decode.string
        , Decode.int |> Decode.map String.fromInt
        ]


statusIdDecoder : Decode.Decoder StatusId
statusIdDecoder =
    idDecoder |> Decode.map StatusId


{-| statusDecoder
-}
statusDecoder : Decode.Decoder Status
statusDecoder =
    Decode.succeed Status
        |> Pipe.required "account" accountDecoder
        |> Pipe.optional "application" (Decode.nullable applicationDecoder) Nothing
        |> Pipe.optional "bookmarked" (Decode.nullable Decode.bool) Nothing
        |> Pipe.optional "card" (Decode.nullable previewCardDecoder) Nothing
        |> Pipe.required "content" Decode.string
        |> Pipe.required "created_at" Decode.string
        |> Pipe.optional "edited_at" (Decode.nullable Decode.string) Nothing
        |> Pipe.required "emojis" (Decode.list customEmojiDecoder)
        |> Pipe.optional "favourited" (Decode.nullable Decode.bool) Nothing
        |> Pipe.required "favourites_count" Decode.int
        |> Pipe.optional "filtered" (Decode.nullable (Decode.list filterResultDecoder)) Nothing
        |> Pipe.required "id" statusIdDecoder
        |> Pipe.required "in_reply_to_account_id" (Decode.nullable idDecoder)
        |> Pipe.required "in_reply_to_id" (Decode.nullable statusIdDecoder)
        |> Pipe.optional "language" (Decode.nullable Decode.string) Nothing
        |> Pipe.required "media_attachments" (Decode.list attachmentDecoder)
        |> Pipe.required "mentions" (Decode.list mentionDecoder)
        |> Pipe.optional "muted" (Decode.nullable Decode.bool) Nothing
        |> Pipe.optional "pinned" (Decode.nullable Decode.bool) Nothing
        |> Pipe.optional "poll" (Decode.nullable pollDecoder) Nothing
        |> Pipe.optional "reblog" (Decode.lazy (\_ -> Decode.nullable reblogDecoder)) Nothing
        |> Pipe.optional "reblogged" (Decode.nullable Decode.bool) Nothing
        |> Pipe.required "reblogs_count" Decode.int
        |> Pipe.required "replies_count" Decode.int
        |> Pipe.required "sensitive" (Decode.nullable Decode.bool)
        |> Pipe.required "spoiler_text" Decode.string
        |> Pipe.required "tags" (Decode.list tagDecoder)
        |> Pipe.optional "text" (Decode.nullable Decode.string) Nothing
        |> Pipe.required "uri" Decode.string
        |> Pipe.required "url" (Decode.nullable Decode.string)
        |> Pipe.required "visibility" Decode.string


{-| statusSourceDecoder
-}
statusSourceDecoder : Decode.Decoder StatusSource
statusSourceDecoder =
    Decode.succeed StatusSource
        |> Pipe.required "id" statusIdDecoder
        |> Pipe.required "text" Decode.string
        |> Pipe.required "spoiler_text" Decode.string


hashtagHistoryDecoder : Decode.Decoder HashtagHistory
hashtagHistoryDecoder =
    Decode.succeed HashtagHistory
        |> Pipe.required "day" Decode.string
        |> Pipe.required "uses" Decode.string
        |> Pipe.required "accounts" Decode.string


hashtagDecoder : Decode.Decoder Hashtag
hashtagDecoder =
    Decode.succeed Hashtag
        |> Pipe.required "name" Decode.string
        |> Pipe.required "url" Decode.string
        |> Pipe.required "history" (Decode.list hashtagHistoryDecoder)


{-| webSocketEventDecoder
-}
webSocketEventDecoder : Decode.Decoder WebSocketMessage
webSocketEventDecoder =
    Decode.succeed WebSocketMessage
        |> Pipe.required "event" Decode.string
        |> Pipe.required "payload"
            -- NOTE: as of the Mastodon API v2.0.0, ids may be either ints or
            -- strings. If we receive an int (most likely for the delete event),
            -- we cast it to a string.
            (Decode.oneOf
                [ Decode.string
                , Decode.int |> Decode.map String.fromInt
                ]
            )


{-| decodeWebSocketMessage
-}
decodeWebSocketMessage : String -> WebSocketEvent
decodeWebSocketMessage message =
    case Decode.decodeString webSocketEventDecoder message of
        Ok { event, payload } ->
            case event of
                "update" ->
                    StatusNewEvent
                        (Decode.decodeString statusDecoder payload
                            |> Result.mapError Decode.errorToString
                        )

                "delete" ->
                    StatusDeleteEvent (StatusId payload)

                "notification" ->
                    NotificationEvent
                        (Decode.decodeString notificationDecoder payload
                            |> Result.mapError Decode.errorToString
                        )

                "status.update" ->
                    StatusUpdateEvent
                        (Decode.decodeString statusDecoder payload
                            |> Result.mapError Decode.errorToString
                        )

                e ->
                    ErrorEvent <| "Unknown WS event " ++ e

        Err error ->
            ErrorEvent <| Decode.errorToString error


{-| customEmojiDecoder
-}
customEmojiDecoder : Decode.Decoder CustomEmoji
customEmojiDecoder =
    Decode.succeed CustomEmoji
        |> Pipe.required "shortcode" Decode.string
        |> Pipe.required "url" Decode.string
        |> Pipe.required "static_url" Decode.string
        |> Pipe.required "visible_in_picker" Decode.bool
        |> Pipe.optional "category" (Decode.nullable Decode.string) Nothing
