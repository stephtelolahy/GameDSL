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
    public let attr: [String: Attribute]

    public init(
        _ id: String,
        @CardActionBuilder actions: () -> [CardAction] = { [] },
        @AttributeBuilder attr: () -> [Attribute] = { [] }
    ) {
        self.id = id
        self.actions = actions()
        self.attr = attr().toDictionary()
    }
}

public struct CardActionImpl: CardAction {
    public let effect: Effect
    public var type: CardActionType
    public var requirements: [Requirement]

    public init(@EffectBuilder effect: () -> Effect) {
        self.effect = effect()
        self.type = .active
        self.requirements = []
    }
}

private extension Array where Element == Attribute {

    func toDictionary() -> [String: Attribute] {
        reduce(into: [String: Attribute]()) {
            $0[$1.id] = $1
        }
    }
}
