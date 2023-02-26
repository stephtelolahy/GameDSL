import Foundation

public protocol BangPlayer {

    var hand: [Card] { get }

    var inPlay: [Card] { get }

    var abilities: [Card] { get }
}

extension Player: BangPlayer {
    
    public var hand: [Card] {
        fatalError()
    }
    
    public var inPlay: [Card] {
        fatalError()
    }
    
    public var abilities: [Card] {
        fatalError()
    }
}
