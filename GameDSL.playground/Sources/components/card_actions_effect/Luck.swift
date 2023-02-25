import Foundation

/// Flip over the top card of the deck, then apply effects according to suits and values
public struct Luck: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute] = [:]
    let regex: String
    let onSuccess: [CardAction]
    let onFailure: [CardAction]?

    public init(_ regex: String,
                @CardActionsBuilder _ onSuccess: () -> [CardAction],
                @CardActionsBuilder onFailure: () -> [CardAction]? = { nil }) {
        self.regex = regex
        self.onSuccess = onSuccess()
        self.onFailure = onFailure()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}

