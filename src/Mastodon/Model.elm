module Mastodon.Model exposing (Account, AccountField, AccessTokenResult, AccountNotificationDate, AppRegistration, Application, Attachment, Client, Context, CustomEmoji, Error(..), Filter, FilterAction(..), FilterContext(..), FilterKeyword, FilterResult, FilterStatus, Hashtag, HashtagHistory, MediaRequestBody, Mention, MovedAccount(..), Notification, NotificationAggregate, Poll, PollOption, PreviewCard, PreviewCardHistory, PreviewCardType(..), Reblog(..), Relationship, SearchResults, Status, StatusEdit, StatusEditRequestBody, StatusId(..), StatusSource, StatusRequestBody, Tag)

{-| Model the Mastodon entities


# Definition

@docs Account, AccountField, AccessTokenResult, AccountNotificationDate, AppRegistration, Application, Attachment, Client, Context, CustomEmoji, Error, Filter, FilterAction, FilterContext, FilterKeyword, FilterResult, FilterStatus, Hashtag, HashtagHistory, MediaRequestBody, Mention, MovedAccount, Notification, NotificationAggregate, Poll, PollOption, PreviewCard, PreviewCardHistory, PreviewCardType, Reblog, Relationship, SearchResults, Status, StatusEdit, StatusEditRequestBody, StatusId, StatusSource, StatusRequestBody, Tag

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


{-| Additional metadata attached to a profile as name-value pairs.
-}
type alias AccountField =
    { name : String
    , value : String
    , verified_at : Maybe String
    }


{-| MovedAccount
-}
type MovedAccount
    = MovedAccount Account


{-| Mastodon account
-}
type alias Account =
    { acct : String
    , avatar : String

    -- A static version of the avatar. Equal to avatar if its value is a static image; different if avatar is an animated GIF.
    , avatar_static : String
    , bot : Bool
    , created_at : String

    -- Whether the account has opted into discovery features such as the profile directory.
    , discoverable : Maybe Bool
    , emojis : List CustomEmoji
    , display_name : String
    , fields : List AccountField
    , followers_count : Int
    , following_count : Int

    -- Indicates that the account represents a Group actor.
    , group : Bool
    , header : String

    -- A static version of the header. Equal to header if its value is a static image; different if header is an animated GIF.
    , header_static : String
    , id : AccountId
    , last_status_at : Maybe String

    -- An extra attribute returned only when an account is silenced. If true, indicates that the account should be hidden behind a warning screen.
    , limited : Maybe Bool
    , locked : Bool
    , moved : Maybe MovedAccount
    , mute_expires_at : Maybe String

    -- Whether the local user has opted out of being indexed by search engines.
    , noindex : Maybe Bool
    , note : String
    , statuses_count : Int
    , suspended : Maybe Bool
    , url : String
    , username : String
    }


{-| AccountNotificationDate
-}
type alias AccountNotificationDate =
    { account : Account
    , created_at : String
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
    , remote_url : Maybe String
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


{-| The action to be taken when a status matches a filter.
-}
type FilterAction
    = WarnAction
    | HideAction


{-| The contexts in which the filter should be applied.
-}
type FilterContext
    = HomeContext
    | NotificationsContext
    | PublicContext
    | ThreadContext
    | AccountContext


{-| Represents a filter whose keywords matched a given status.
-}
type alias Filter =
    { context : List FilterContext
    , id : String
    , expires_at : Maybe String
    , keywords : List FilterKeyword
    , filter_action : FilterAction
    , statuses : List FilterStatus
    , title : String
    }


{-| Represents a filter whose keywords matched a given status.
-}
type alias FilterKeyword =
    { id : String
    , keyword : String
    , whole_word : Bool
    }


{-| Represents a status ID that, if matched, should cause the filter action to be taken.
-}
type alias FilterStatus =
    { id : String
    , status_id : StatusId
    }


{-| Represents a filter whose keywords matched a given status.
-}
type alias FilterResult =
    { filter : Filter
    , keyword_matches : Maybe (List String)
    , status_matches : Maybe (List StatusId)
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


{-| Represents a poll attached to a status.
-}
type alias Poll =
    { id : String
    , emojis : List CustomEmoji
    , expired : Bool
    , expires_at : Maybe String
    , multiple : Bool
    , options : List PollOption
    , own_votes : List Int
    , voters_count : Maybe Int
    , votes_count : Int
    , voted : Maybe Bool
    }


{-| Poll::Option attributes
-}
type alias PollOption =
    { title : String
    , votes_count : Maybe Int
    }


{-| Represents a rich preview card that is generated using OpenGraph tags from a URL.
-}
type alias PreviewCard =
    { author_name : String
    , author_url : String
    , blurhash : Maybe String
    , description : String
    , embed_url : String
    , height : Int
    , history : Maybe (List PreviewCardHistory)
    , html : String
    , image : Maybe String
    , provider_name : String
    , provider_url : String
    , title : String
    , type_ : PreviewCardType
    , url : String
    , width : Int
    }


{-| Usage statistics for given days (typically the past week).
-}
type alias PreviewCardHistory =
    { accounts : String
    , day : String
    , uses : String
    }


{-| Preview card type
-}
type PreviewCardType
    = Link
    | Photo
    | Video
    | Rich


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

    -- If the current token has an authorized user: Have you bookmarked this status?
    , bookmarked : Maybe Bool
    , card : Maybe PreviewCard
    , content : String
    , created_at : String
    , edited_at : Maybe String
    , emojis : List CustomEmoji
    , favourited : Maybe Bool
    , favourites_count : Int

    -- If the current token has an authorized user: The filter and keywords that matched this status.
    , filtered : Maybe (List FilterResult)
    , id : StatusId
    , in_reply_to_account_id : Maybe String
    , in_reply_to_id : Maybe StatusId
    , language : Maybe String
    , media_attachments : List Attachment
    , mentions : List Mention

    -- If the current token has an authorized user: Have you muted notifications for this status’s conversation?
    , muted : Maybe Bool

    -- If the current token has an authorized user: Have you pinned this status? Only appears if the status is pinnable.
    , pinned : Maybe Bool
    , poll : Maybe Poll
    , reblog : Maybe Reblog
    , reblogged : Maybe Bool
    , reblogs_count : Int
    , replies_count : Int
    , sensitive : Maybe Bool
    , spoiler_text : String
    , tags : List Tag
    , text : Maybe String
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
    { shortcode : String
    , url : String
    , static_url : String
    , visible_in_picker : Bool
    , category : Maybe String
    }
