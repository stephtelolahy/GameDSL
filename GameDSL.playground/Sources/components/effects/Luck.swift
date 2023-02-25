import Foundation

public struct Luck: Effect {
    let regex: String
    let onSuccess: [Effect]
    let onFailure: [Effect]

    public init(_ regex: String,
                @EffectBuilder _ onSuccess: () -> [Effect],
                @EffectBuilder onFailure: () -> [Effect] = { [] }) {
        self.regex = regex
        self.onSuccess = onSuccess()
        self.onFailure = onFailure()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}

