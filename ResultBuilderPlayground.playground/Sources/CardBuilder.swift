import Foundation

@resultBuilder
public struct CardBuilder {

    public static func buildBlock() -> [Card] {
        []
    }

    public static func buildBlock(_ components: Card...) -> [Card] {
        components
    }
}
