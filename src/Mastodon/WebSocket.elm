module Mastodon.WebSocket exposing (StreamType(..), WebSocketEvent(..), WebSocketMessage)

{-| Model the Mastodon websocket connections and events


# Definition

@docs StreamType, WebSocketEvent, WebSocketMessage

-}

import Mastodon.Model exposing (..)


{-| Stream type
User, local or global stream type
-}
type StreamType
    = UserStream
    | LocalPublicStream
    | GlobalPublicStream


{-| Websocket events
-}
type WebSocketEvent
    = StatusUpdateEvent (Result String Status)
    | StatusNewEvent (Result String Status)
    | NotificationEvent (Result String Notification)
    | StatusDeleteEvent StatusId
    | ErrorEvent String


{-| Websocket message
-}
type alias WebSocketMessage =
    { event : String
    , payload : String
    }
