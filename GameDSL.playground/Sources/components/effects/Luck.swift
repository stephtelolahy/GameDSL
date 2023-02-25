import Foundation

/// Flip over the top card of the deck, then apply effects according to suits and values
public struct Luck: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute]

    public init(_ regex: String,
                @CardActionBuilder _ onSuccess: () -> CardAction,
                @CardActionBuilder onFailure: () -> CardAction? = { nil }) {
        self.ctx = [:]
//        self.regex = regex
//        self.onSuccess = onSuccess()
//        self.onFailure = onFailure()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}

