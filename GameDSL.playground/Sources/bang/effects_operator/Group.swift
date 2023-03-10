import Foundation

/// Dispatch effects sequentially
public struct Group: Effect {
    public var ctx: [String: Attribute] = [:]
    let content: [Effect]

    public init(@EffectsBuilder content: () -> [Effect]) {
        self.content = content()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
