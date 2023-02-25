import Foundation

/// Flip over the top card of the deck, then apply effects according to suits and values
public struct Luck: Effect {
    public var ctx: [String: Attribute] = [:]
    let regex: String
    let onSuccess: [Effect]
    let onFailure: [Effect]?

    public init(_ regex: String,
                @EffectsBuilder _ onSuccess: () -> [Effect],
                @EffectsBuilder onFailure: () -> [Effect]? = { nil }) {
        self.regex = regex
        self.onSuccess = onSuccess()
        self.onFailure = onFailure()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}

