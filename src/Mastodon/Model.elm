module Mastodon.Model exposing
    ( Account, AccessTokenResult, AccountNotificationDate, AppRegistration, Application, Attachment, Client, Context, Error(..), Hashtag, HashtagHistory, MediaRequestBody, Mention, Notification, NotificationAggregate, Reblog(..), Relationship, SearchResults, Status, StatusEdit, StatusEditRequestBody, StatusId(..), StatusSource, StatusRequestBody, Tag
    , CustomEmoji
    )

{-| Model the Mastodon entities


# Definition

@docs Account, AccessTokenResult, AccountNotificationDate, AppRegistration, Application, Attachment, Client, Context, Error, Hashtag, HashtagHistory, MediaRequestBody, Mention, Notification, NotificationAggregate, Reblog, Relationship, SearchResults, Status, StatusEdit, StatusEditRequestBody, StatusId, StatusSource, StatusRequestBody, Tag

-}


{-| Mastodon AccountId
-}
type alias AccountId =
    String


type alias ClientId =
    String


type alias ClientSecret =
    String


type alias Server =
    String


{-| Status id
-}
type StatusId
    = StatusId String


type alias StatusCode =
    Int


type alias StatusMsg =
    String


type alias Token =
    String


{-| Mastodon error types
-}
type Error
    = MastodonError StatusCode StatusMsg String
    | ServerError StatusCode StatusMsg String
    | TimeoutError
    | NetworkError


{-| Server token
-}
type alias AccessTokenResult =
    { server : Server
    , accessToken : Token
    }


{-| App registration
-}
type alias AppRegistration =
    { server : Server
    , scope : String
    , client_id : ClientId
    , client_secret : ClientSecret
    , id : String
    , redirect_uri : String
    }


{-| Mastodon account
-}
type alias Account =
    { acct : String
    , avatar : String
    , created_at : String
    , display_name : String
    , followers_count : Int
    , following_count : Int
    , header : String
    , id : AccountId
    , locked : Bool
    , note : String
    , statuses_count : Int
    , url : String
    , username : String
    }


{-| Application
-}
type alias Application =
    { name : String
    , website : Maybe String
    }


{-| Attachment can be an image, a video, an audio or a gifv
-}
type alias Attachment =
    -- type_: -- "image", "video", "gifv", "audio"
    { id : String
    , type_ : String
    , url : String
    , remote_url : String
    , preview_url : Maybe String
    , text_url : Maybe String
    , description : Maybe String
    }


{-| Web Client
-}
type alias Client =
    { server : Server
    , token : Token
    , account : Maybe Account
    }


{-| Context of a status

Contains ancestors statuses and descendants statuses

-}
type alias Context =
    { ancestors : List Status
    , descendants : List Status
    }


{-| Update a media
-}
type alias MediaRequestBody =
    -- description: A plain-text description of the media, for accessibility purposes.
    { description : String
    }


{-| Mention
-}
type alias Mention =
    { id : AccountId
    , url : String
    , username : String
    , acct : String
    }


{-| Notification

       - id: The notification ID
       - type_: One of: "mention", "reblog", "favourite", "follow"
       - created_at: The time the notification was created
       - account: The Account sending the notification to the user
       - status: The Status associated with the notification, if applicable

-}
type alias Notification =
    {-
       - id: The notification ID
       - type_: One of: "mention", "reblog", "favourite", "follow"
       - created_at: The time the notification was created
       - account: The Account sending the notification to the user
       - status: The Status associated with the notification, if applicable
    -}
    { id : String
    , type_ : String
    , created_at : String
    , account : Account
    , status : Maybe Status
    }


{-| AccountNotificationDate
-}
type alias AccountNotificationDate =
    { account : Account
    , created_at : String
    }


{-| NotificationAggregate

Group multiple notification together

-}
type alias NotificationAggregate =
    { id : String
    , type_ : String
    , status : Maybe Status
    , accounts : List AccountNotificationDate
    , created_at : String
    }


{-| Reblog of a Status
-}
type Reblog
    = Reblog Status


{-| Relationship between followers
-}
type alias Relationship =
    { id : String
    , blocking : Bool
    , followed_by : Bool
    , following : Bool
    , muting : Bool
    , requested : Bool
    }


{-| SearchResults
-}
type alias SearchResults =
    { accounts : List Account
    , statuses : List Status
    , hashtags : List Hashtag
    }


{-| Status
-}
type alias Status =
    { account : Account
    , application : Maybe Application
    , content : String
    , created_at : String
    , edited_at : Maybe String
    , favourited : Maybe Bool
    , favourites_count : Int
    , id : StatusId
    , in_reply_to_account_id : Maybe String
    , in_reply_to_id : Maybe StatusId
    , media_attachments : List Attachment
    , mentions : List Mention
    , reblog : Maybe Reblog
    , reblogged : Maybe Bool
    , reblogs_count : Int
    , sensitive : Maybe Bool
    , spoiler_text : String
    , tags : List Tag
    , uri : String
    , url : Maybe String
    , visibility : String
    }


{-| Used to get the original content of a status
-}
type alias StatusSource =
    { id : StatusId
    , text : String
    , spoiler_text : String
    }


{-| Used when editing a status
-}
type alias StatusEdit =
    { status : Status
    , text : Maybe String
    , spoiler_text : Maybe String
    }


{-| Submit a status
-}
type alias StatusRequestBody =
    -- status: The text of the status
    -- in_reply_to_id: local ID of the status you want to reply to
    -- sensitive: set this to mark the media of the status as NSFW
    -- spoiler_text: text to be shown as a warning before the actual content
    -- visibility: either "direct", "private", "unlisted" or "public"
    { status : String
    , in_reply_to_id : Maybe StatusId
    , spoiler_text : Maybe String
    , sensitive : Bool
    , visibility : String
    , media_ids : List String
    }


{-| Edit a status
-}
type alias StatusEditRequestBody =
    -- status: The text of the status
    -- sensitive: set this to mark the media of the status as NSFW
    -- spoiler_text: text to be shown as a warning before the actual content
    { status : String
    , spoiler_text : Maybe String
    , sensitive : Bool
    , media_ids : List String
    }


{-| tags

    #hashtag

-}
type alias Tag =
    { name : String
    , url : String
    }


{-| HashtagHistory
-}
type alias HashtagHistory =
    { day : String
    , uses : String
    , accounts : String
    }


{-| Tag with history
-}
type alias Hashtag =
    { name : String
    , url : String
    , history : List HashtagHistory
    }


{-| CustomEmoji
-}
type alias CustomEmoji =
    -- spoiler_text: text to be shown as a warning before the actual content
    { shortcode : String
    , url : String
    , static_url : String
    , visible_in_picker : Bool
    , category : Maybe String
    }
