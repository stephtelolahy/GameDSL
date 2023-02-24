import Foundation

/// Trading card games model
/// It is turn based, cards have actions, cards have properties and cards have rules
public protocol Game {
    var attr: [Attribute] { get }
    var players: [Player] { get }
    var locations: [CardLocation] { get }
    var event: Result<Event, Error>? { get set }
}

/// Any card, player or game attribute
/// Expected to find single Value for each attribute name
public protocol Attribute {
    var id: String { get }
}

/// Game event
public protocol Event {
//    func resolve(_ ctx: Game) -> Result<Game, Error>
}

/// Players who are participating in a game
public protocol Player {
    var id: String { get }
    var attr: [Attribute] { get }
    var locations: [CardLocation] { get }
}

/// Card Location in the game
public protocol CardLocation {
    var id: String { get }
    var cards: [Card] { get }
    var visibility: [String] { get }
}

/// Cards that are used in a game.
/// Cards can have a cost, can have multiple properties, define additional rules, have actions that can be played and have side effects that happen when they are being played.
public protocol Card {
    var id: String { get }
    var attributes: [Attribute] { get }
    var actions: [CardAction] { get }
}

public protocol CardAction {
    /// When `playable` == ` true`, the card becomes active when requirments is met, then player can choose to play it
    /// When `playable` == `false,` then card action is triggered automatically
    var playable: Bool { get }
    var requirements: [Requirement] { get }
    var effects: [Effect] { get }
    var cost: Int { get }
}

/// Define the constraints to play a card
public protocol Requirement {
    func match(_ ctx: Game) -> Result<Void, Error>
}

/// Card side effects
public protocol Effect: Event {
    /// Context data for resolving
//    var ctx: [Attribute] { get }
}
