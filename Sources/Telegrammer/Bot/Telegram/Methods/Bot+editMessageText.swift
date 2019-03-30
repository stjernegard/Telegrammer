// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.


import HTTP

public extension Bot {

    /// Parameters container struct for `editMessageText` method
    struct EditMessageTextParams: JSONEncodable {

        /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
        var chatId: ChatId?

        /// Required if inline_message_id is not specified. Identifier of the sent message
        var messageId: Int?

        /// Required if chat_id and message_id are not specified. Identifier of the inline message
        var inlineMessageId: String?

        /// New text of the message
        var text: String

        /// Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
        var parseMode: ParseMode?

        /// Disables link previews for links in this message
        var disableWebPagePreview: Bool?

        /// A JSON-serialized object for an inline keyboard.
        var replyMarkup: InlineKeyboardMarkup?

        /// Custom keys for coding/decoding `EditMessageTextParams` struct
        enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case text = "text"
            case parseMode = "parse_mode"
            case disableWebPagePreview = "disable_web_page_preview"
            case replyMarkup = "reply_markup"
        }

        public init(chatId: ChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, text: String, parseMode: ParseMode? = nil, disableWebPagePreview: Bool? = nil, replyMarkup: InlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.text = text
            self.parseMode = parseMode
            self.disableWebPagePreview = disableWebPagePreview
            self.replyMarkup = replyMarkup
        }
    }

    /**
     Use this method to edit text and game messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.

     SeeAlso Telegram Bot API Reference:
     [EditMessageTextParams](https://core.telegram.org/bots/api#editmessagetext)

     - Parameters:
         - params: Parameters container, see `EditMessageTextParams` struct
     - Throws: Throws on errors
     - Returns: Future of `MessageOrBool` type
     */
    @discardableResult
    func editMessageText(params: EditMessageTextParams) throws -> Future<MessageOrBool> {
        let body = try httpBody(for: params)
        let headers = httpHeaders(for: params)
        let response: Future<TelegramContainer<MessageOrBool>>
        response = try client.respond(endpoint: "editMessageText", body: body, headers: headers)
        return response.flatMap(to: MessageOrBool.self) { try self.wrap($0) }
    }
}
