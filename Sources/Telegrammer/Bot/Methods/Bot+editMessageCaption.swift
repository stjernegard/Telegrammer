// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.


import HTTP

public extension Bot {

    /// Parameters container struct for `editMessageCaption` method
    struct EditMessageCaptionParams: JSONEncodable {

        /// Required if inline_message_id is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
        var chatId: ChatId?

        /// Required if inline_message_id is not specified. Identifier of the sent message
        var messageId: Int?

        /// Required if chat_id and message_id are not specified. Identifier of the inline message
        var inlineMessageId: String?

        /// New caption of the message
        var caption: String?

        /// Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.
        var parseMode: ParseMode?

        /// A JSON-serialized object for an inline keyboard.
        var replyMarkup: InlineKeyboardMarkup?

        /// Custom keys for coding/decoding `EditMessageCaptionParams` struct
        enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case inlineMessageId = "inline_message_id"
            case caption = "caption"
            case parseMode = "parse_mode"
            case replyMarkup = "reply_markup"
        }

        public init(chatId: ChatId? = nil, messageId: Int? = nil, inlineMessageId: String? = nil, caption: String? = nil, parseMode: ParseMode? = nil, replyMarkup: InlineKeyboardMarkup? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.inlineMessageId = inlineMessageId
            self.caption = caption
            self.parseMode = parseMode
            self.replyMarkup = replyMarkup
        }
    }

    /**
     Use this method to edit captions of messages sent by the bot or via the bot (for inline bots). On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned.

     SeeAlso Telegram Bot API Reference:
     [EditMessageCaptionParams](https://core.telegram.org/bots/api#editmessagecaption)
     
     - Parameters:
         - params: Parameters container, see `EditMessageCaptionParams` struct
     - Throws: Throws on errors
     - Returns: Future of `MessageOrBool` type
     */
    @discardableResult
    func editMessageCaption(params: EditMessageCaptionParams? = nil) throws -> Future<MessageOrBool> {
        let body = try httpBody(for: params)
        let headers = httpHeaders(for: params)
        let response: Future<TelegramContainer<MessageOrBool>>
        response = try client.respond(endpoint: "editMessageCaption", body: body, headers: headers)
        return response.flatMap(to: MessageOrBool.self) { try self.wrap($0) }
    }
}
