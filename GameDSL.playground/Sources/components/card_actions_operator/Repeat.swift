import Foundation

/// Repeat an effect
public struct Repeat: CardAction {
    public var type: CardActionType = .active
    public var requirements: [Requirement] = []
    public var ctx: [String: Attribute] = [:]
    var times: ArgNumber
    var content: CardAction

    public init(_ times: ArgNumber, @CardActionBuilder content: () -> CardAction) {
        self.times = times
        self.content = content()
    }

    public init(_ times: Int, @CardActionBuilder content: () -> CardAction) {
        self.times = NumExact(times)
        self.content = content()
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
