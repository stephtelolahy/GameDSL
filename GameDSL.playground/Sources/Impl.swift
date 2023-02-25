import Foundation

public struct CardImpl: Card {
    public let id: String
    public let attributes: [Attribute]
    public let actions: [CardAction]

    public init(
        _ id: String,
        @AttributeBuilder attributes: () -> [Attribute] = { [] },
        @CardActionBuilder actions: () -> [CardAction] = { [] }
    ) {
        self.id = id
        self.attributes = attributes()
        self.actions = actions()
    }
}

public struct CardActionImpl: CardAction {
    public let playable: Bool
    public let requirements: [Requirement]
    public let effects: [Effect]
    public var cost: String?
    public var target: String?

    public init(
        playable: Bool,
        @EffectBuilder effects: () -> [Effect],
        @RequirementBuilder requirements: () -> [Requirement] = { [] }
    ) {
        self.playable = playable
        self.effects = effects()
        self.requirements = requirements()
        self.cost = nil
        self.target = nil
    }
}


public struct GameImpl: Game {
    public let attr: [Attribute]
    public let players: [Player]
    public let locations: [CardLocationAttribute]
    public var event: Result<Event, Error>?

    public init(
        @PlayerBuilder players: () -> [Player],
        @AttributeBuilder attr: () -> [Attribute]
    ) {
        self.players = players()
        self.attr = attr()
        self.locations = []
    }
}

public struct PlayerImpl: Player {
    public let id: String
    public let attr: [Attribute]
    public let locations: [CardLocationAttribute]

    public init(_ id: String, @AttributeBuilder _ attr: () -> [Attribute] = { [] }) {
        self.id = id
        self.attr = attr()
        self.locations = []
    }
}

