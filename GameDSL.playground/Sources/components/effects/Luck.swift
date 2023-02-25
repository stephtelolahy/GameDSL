import Foundation

/// Flip over the top card of the deck, then apply effects according to suits and values
public struct Luck: Effect {
    public var attr: [String: Attribute]

    public init(_ regex: String,
                @EffectBuilder _ onSuccess: () -> Effect,
                @EffectBuilder onFailure: () -> Effect? = { nil }) {
        self.attr = [:]
        // TODO: setup attributes
//        self.regex = regex
//        self.onSuccess = onSuccess()
//        self.onFailure = onFailure()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}

