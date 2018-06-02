//
//  Updater.swift
//  Telegrammer
//
//  Created by Givi Pataridze on 09.04.2018.
//

import HTTP
import NIO

public final class Updater {
	
    public let bot: Bot
    public let dispatcher: Dispatcher
    public let worker: Worker
	
	private var longpollingConnection: Longpolling!
    private var webhooksListener: Webhooks!
	
	@discardableResult
    public init(bot: Bot, dispatcher: Dispatcher, worker: Worker = MultiThreadedEventLoopGroup(numberOfThreads: 1)) {
        self.bot = bot
        self.dispatcher = dispatcher
        self.worker = worker
    }
    
    public func startWebhooks() throws -> Future<Void> {
        webhooksListener = Webhooks(bot: bot, dispatcher: dispatcher, worker: worker)
        return try webhooksListener.start()
    }
	
	public func startLongpolling() throws -> Future<Void> {
		longpollingConnection = Longpolling(bot: bot, dispatcher: dispatcher, worker: worker)
		return try longpollingConnection.start()
	}
	
    public func stop() {
        if let longpollingConnection = longpollingConnection {
            longpollingConnection.stop()
        }
        if let webhooksListener = webhooksListener {
            webhooksListener.stop()
        }
    }
}
