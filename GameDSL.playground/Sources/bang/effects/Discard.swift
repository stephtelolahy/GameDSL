import Foundation

/// Discard a player's card to discard pile
/// Actor is the card chooser
public struct Discard: Effect {
    public var ctx: [String: Attribute] = [:]
    let player: ArgPlayer
    let card: ArgCard

    public init(player: ArgPlayer = PlayerActor(), card: ArgCard) {
        self.player = player
        self.card = card
    }

    public func resolve(_ ctx: Game) -> Result<EventOutput, Error> {
        fatalError()
    }
}
