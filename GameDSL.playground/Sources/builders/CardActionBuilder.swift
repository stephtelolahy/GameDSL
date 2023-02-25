import Foundation

@resultBuilder
public struct CardActionBuilder {

    public static func buildBlock(_ components: CardAction...) -> [CardAction] {
        components
    }    
}

public extension CardActionImpl {

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
