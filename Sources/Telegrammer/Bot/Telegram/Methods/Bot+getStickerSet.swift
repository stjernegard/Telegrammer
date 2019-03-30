// Telegrammer - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.


import HTTP

public extension Bot {

    /// Parameters container struct for `getStickerSet` method
    struct GetStickerSetParams: JSONEncodable {

        /// Name of the sticker set
        var name: String

        /// Custom keys for coding/decoding `GetStickerSetParams` struct
        enum CodingKeys: String, CodingKey {
            case name = "name"
        }

        public init(name: String) {
            self.name = name
        }
    }

    /**
     Use this method to get a sticker set. On success, a StickerSet object is returned.

     SeeAlso Telegram Bot API Reference:
     [GetStickerSetParams](https://core.telegram.org/bots/api#getstickerset)

     - Parameters:
         - params: Parameters container, see `GetStickerSetParams` struct
     - Throws: Throws on errors
     - Returns: Future of `StickerSet` type
     */
    @discardableResult
    func getStickerSet(params: GetStickerSetParams) throws -> Future<StickerSet> {
        let body = try httpBody(for: params)
        let headers = httpHeaders(for: params)
        let response: Future<TelegramContainer<StickerSet>>
        response = try client.respond(endpoint: "getStickerSet", body: body, headers: headers)
        return response.flatMap(to: StickerSet.self) { try self.wrap($0) }
    }
}
