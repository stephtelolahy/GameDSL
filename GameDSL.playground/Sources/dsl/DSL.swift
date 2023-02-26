import Foundation

public extension Game {
    init(@AttributeBuilder attr: () -> [Attribute]) {
        self.attr = attr().toDictionary()
    }
}

public extension Player {
    init(_ id: String, @AttributeBuilder _ attr: () -> [Attribute] = { [] }) {
        self.id = id
        self.attr = attr().toDictionary()
    }
}

public extension Card {
    init(_ id: String, @CardActionBuilder actions: () -> [CardAction] = { [] }) {
        self.id = id
        self.actions = actions()
        self.attr = [:]
    }

    func attr(@AttributeBuilder attr: () -> [Attribute]) -> Self {
        .init(id: id, actions: actions, attr: attr().toDictionary())
    }
}

public extension Effect {

    func active(@RequirementBuilder requirements: () -> [Requirement] = { [] }) -> CardAction {
        CardAction(effect: self,
                   type: .active,
                   requirements: requirements())
    }

    func triggered(@RequirementBuilder requirements: () -> [Requirement]) -> CardAction {
        CardAction(effect: self,
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
