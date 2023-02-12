import Foundation

@resultBuilder
public struct AttributeBuilder {

    public static func buildBlock(_ components: Attribute...) -> [Attribute] {
        components
    }

    static func buildExpression(_ player: Player) -> Attribute {
        Active(player)
    }

    static func buildExpression(_ attr: Attribute) -> Attribute {
        attr
    }
}
