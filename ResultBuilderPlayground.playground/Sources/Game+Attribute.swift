import Foundation

public struct Active: Attribute {
    public let elementName: String = "active"
    let player: Player

    public init(_ player: Player) {
        self.player = player
    }
}

