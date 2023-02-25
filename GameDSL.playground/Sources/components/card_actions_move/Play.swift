import Foundation

/// Play a card, discard immediately
public struct Play: Effect {
    public var ctx: [String: Attribute] = [:]
    let target: ArgPlayer?
    let content: [Effect]

    public init(target: ArgPlayer? = nil, @EffectsBuilder content: () -> [Effect]) {
        self.target = target
        self.content = content()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
