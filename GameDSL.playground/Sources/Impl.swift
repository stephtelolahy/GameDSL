import Foundation

public struct RealCard: Card {
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

public struct RealCardAction: CardAction {
    public let playable: Bool
    public let requirements: [Requirement]
    public let effects: [Effect]
    public let cost: Int

    public init(playable: Bool, @EffectBuilder _ content: () -> [Effect]) {
        self.playable = playable
        self.effects = content()
        self.requirements = []
        self.cost = 0
    }
}


public struct RealGame: Game {
    public let attr: [Attribute]
    public let players: [Player]
    public let locations: [CardLocation]
    public var event: Result<Event, Error>?

    public init(@AttributeBuilder _ content: () -> [Attribute]) {
        self.attr = content()
        self.players = []
        self.locations = []
    }
}

public struct RealPlayer: Player {
    public let id: String
    public let attr: [Attribute]
    public let locations: [CardLocation]

    public init(_ id: String, @AttributeBuilder _ content: () -> [Attribute] = { [] }) {
        self.id = id
        self.attr = content()
        self.locations = []
    }
}

