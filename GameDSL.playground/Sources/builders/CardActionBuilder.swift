import Foundation


@resultBuilder
public struct CardActionsBuilder {

    public static func buildBlock(_ components: CardAction...) -> [CardAction] {
        components
    }
}

@resultBuilder
public struct CardActionBuilder {

    public static func buildBlock(_ component: CardAction) -> CardAction {
        component
    }

    static func buildArray(_ components: [CardAction]) -> CardAction {
        fatalError()
    }
}

public extension CardAction {

    func active(@RequirementBuilder requirements: () -> [Requirement] = { [] }) -> Self {
        var copy = self
        copy.type = .active
        copy.requirements = requirements()
        return self
    }

    func triggered(@RequirementBuilder requirements: () -> [Requirement] = { [] }) -> Self {
        var copy = self
        copy.type = .triggerred
        copy.requirements = requirements()
        return self
    }
}
