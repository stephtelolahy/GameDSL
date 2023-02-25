import Foundation

public struct Players: Attribute {
    public let name: String = "players"
    public let players: [Player]

    public init(@PlayerBuilder _ content: () -> [Player]) {
        self.players = content()
    }
}
