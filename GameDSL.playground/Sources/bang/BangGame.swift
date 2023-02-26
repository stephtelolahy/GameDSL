import Foundation

protocol BangGame {
    
    var players: [Player] { get }
    
    var turnPlayer: Player? { get }
}

extension Game: BangGame {
    
    var players: [Player] {
        fatalError()
    }
    
    var turnPlayer: Player? {
        fatalError()
    }
}
