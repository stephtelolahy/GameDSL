import Foundation

public struct Game {
    var attr: [Attribute] = []
    var players: [Player] = []
    var turn: String?
    var event: Any?
    var isOver: Bool = false
}

public extension Game {
    init(@PlayerBuilder _ content: () -> [Player]) {
        self.players = content()
    }
}

public extension Game {
    func turn(_ turn: String) -> Self {
        .init(attr: self.attr, players: self.players, turn: turn, event: self.event, isOver: self.isOver)
    }
}
