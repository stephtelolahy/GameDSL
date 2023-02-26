import Foundation

public struct GameImpl: Game {
    public let players: [Player]
    public var isOver: Bool = false
    public let attr: [String: Attribute]
    public var event: Result<Event, Error>?

    public init(@AttributeBuilder attr: () -> [Attribute]) {
        self.attr = attr().toDictionary()
        // TODO: get players from attributes
        self.players = []
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

    public init(_ id: String, @CardActionBuilder actions: () -> [CardAction] = { [] }) {
        self.id = id
        self.actions = actions()
    }
}

public extension CardImpl {
    func attr(@AttributeBuilder attr: () -> [Attribute]) -> Self {
        var copy = self
        copy.attr = attr().toDictionary()
        return copy
    }
}

public struct CardActionImpl: CardAction {
    public let effect: Effect
    public let type: CardActionType
    public let requirements: [Requirement]
}

public extension Effect {

    func active(@RequirementBuilder requirements: () -> [Requirement] = { [] }) -> CardAction {
        CardActionImpl(effect: self,
                       type: .active,
                       requirements: requirements())
    }

    func triggered(@RequirementBuilder requirements: () -> [Requirement]) -> CardAction {
        CardActionImpl(effect: self,
                       type: .triggered,
                       requirements: requirements())
    }
}

extension Array where Element == Attribute {

    func toDictionary() -> [String: Attribute] {
        reduce(into: [String: Attribute]()) {
            $0[$1.name] = $1
        }
    }
}
