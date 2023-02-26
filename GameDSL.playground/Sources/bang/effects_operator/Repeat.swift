import Foundation

/// Repeat an effect
public struct Repeat: Effect {
    public var ctx: [String: Attribute] = [:]
    var times: ArgNumber
    var content: Effect

    public init(_ times: ArgNumber, @EffectBuilder content: () -> Effect) {
        self.times = times
        self.content = content()
    }

    public init(_ times: Int, @EffectBuilder content: () -> Effect) {
        self.init(NumExact(times), content: content)
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
