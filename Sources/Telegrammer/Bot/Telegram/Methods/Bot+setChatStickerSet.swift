// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.


import HTTP

public extension Bot {

    /// Parameters container struct for `setChatStickerSet` method
    struct SetChatStickerSetParams: JSONEncodable {

        /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
        var chatId: ChatId

        /// Name of the sticker set to be set as the group sticker set
        var stickerSetName: String

        /// Custom keys for coding/decoding `SetChatStickerSetParams` struct
        enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case stickerSetName = "sticker_set_name"
        }

        public init(chatId: ChatId, stickerSetName: String) {
            self.chatId = chatId
            self.stickerSetName = stickerSetName
        }
    }

    /**
     Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.

     SeeAlso Telegram Bot API Reference:
     [SetChatStickerSetParams](https://core.telegram.org/bots/api#setchatstickerset)

     - Parameters:
         - params: Parameters container, see `SetChatStickerSetParams` struct
     - Throws: Throws on errors
     - Returns: Future of `Bool` type
     */
    @discardableResult
    func setChatStickerSet(params: SetChatStickerSetParams) throws -> Future<Bool> {
        let body = try httpBody(for: params)
        let headers = httpHeaders(for: params)
        let response: Future<TelegramContainer<Bool>>
        response = try client.respond(endpoint: "setChatStickerSet", body: body, headers: headers)
        return response.flatMap(to: Bool.self) { try self.wrap($0) }
    }
}
