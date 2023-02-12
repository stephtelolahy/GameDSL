import Foundation

@resultBuilder
public struct PlayerBuilder {

    public static func buildBlock(_ components: Player...) -> [Player] {
        components
    }
}
