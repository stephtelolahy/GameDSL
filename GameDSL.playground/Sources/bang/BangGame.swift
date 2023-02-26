import Foundation

protocol BangGame {

    var players: [Player] { get }
}

extension Game: BangGame {
    var players: [Player] {
        fatalError()
    }
}
