import Foundation

@resultBuilder
public struct AttributeBuilder {

    public static func buildBlock() -> [Attribute] {
        []
    }

    public static func buildBlock(_ components: Attribute...) -> [Attribute] {
        components
    }

//    public static func buildExpression(_ player: Player) -> [Attribute] {
//        [Active(player)]
//    }
}
