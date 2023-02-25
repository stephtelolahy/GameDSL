import Foundation

public struct GameImpl: Game {
    public let players: [Player]
    public let attr: [String: Attribute]
    public var event: Result<Event, Error>?

    public init(
        @PlayerBuilder players: () -> [Player],
        @AttributeBuilder attr: () -> [Attribute]
    ) {
        self.players = players()
        self.attr = attr().toDictionary()
    }
}

public struct PlayerImpl: Player {
    public let id: String
    public let attr: [String: Attribute]

    public init(_ id: String, @AttributeBuilder _ attr: () -> [Attribute] = { [] }) {
        self.id = id
        self.attr = attr().toDictionary()
    }
}

public struct CardImpl: Card {
    public let id: String
    public let actions: [CardAction]
    public var attr: [String: Attribute] = [:]

    public init(_ id: String, @CardActionsBuilder actions: () -> [CardAction] = { [] }) {
        self.id = id
        self.actions = actions()
    }
}

extension CardImpl {

    public func attr(@AttributeBuilder attr: () -> [Attribute]) -> Self {
        var copy = self
        copy.attr = attr().toDictionary()
        return copy
    }
}

extension Array where Element == Attribute {

    func toDictionary() -> [String: Attribute] {
        reduce(into: [String: Attribute]()) {
            $0[$1.name] = $1
        }
    }
}
