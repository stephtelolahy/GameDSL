import Foundation

public struct Players: Attribute {
    public let elementName: String = "players"
    let players: [Player]

    public init(@PlayerBuilder _ content: () -> [Player]) {
        self.players = content()
    }
}
