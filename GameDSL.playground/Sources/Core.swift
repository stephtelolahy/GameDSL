import Foundation
import Combine

/// The game engine
public protocol Engine {

    /// observable game state
    var state: CurrentValueSubject<Game, Never> { get }

    /// events queue that have to be resolved in order
    var queue: [Event] { get }

    /// input a move
    func input(_ move: Event)

    /// process event queue
    func update()
}

/// Function that causes any change in the game state
public protocol Event {
    func resolve(_ ctx: Game) -> Result<EventOutput, Error>
}

/// Resolving an event may update game or push another event
public protocol EventOutput {

    /// Updated state
    var state: Game? { get }

    /// Children to be queued for resolving
    var children: [Event]? { get }
}

/// Trading card games state
/// It is turn based, cards have actions, cards have properties and cards have rules
public protocol Game {

    /// all players
    var players: [Player] { get }

    /// All attributes
    var attr: [String: Attribute] { get }

    /// last occurred event
    var event: Result<Event, Error>? { get set }
}

/// Any card, player, game attribute
/// Expected to be unique
public protocol Attribute {

    /// attribute name
    var id: String { get }
}

/// Player who is participating in a game
public protocol Player {

    /// player unique identifier
    var id: String { get }

    /// All attributes
    var attr: [String: Attribute] { get }
}

/// Card Location in the game
public protocol CardLocationAttribute: Attribute {

    /// All cards in the location
    var cards: [Card] { get }

    /// players who can see the content of this location
    var visibility: [String]? { get }
}

/// Cards that are used in a game.
/// Cards can have a cost, can have multiple properties, define additional rules,
/// have actions that can be played and have side effects that happen when they are being played.
public protocol Card {

    /// card unique identifier
    var id: String { get }

    /// Actions that can be performed with the card
    var actions: [CardAction] { get }

    /// All attributes
    var attr: [String: Attribute] { get }
}

public protocol CardAction {

    /// The manner an action is performed
    /// if  `true`, the card becomes active when requirments is met, then player can play it
    /// If `false,` then card action is triggered automatically, the side effects are applyed
    var playable: Bool { get }

    /// side effects on playing this card
    var effects: [Effect] { get }

    /// requirements for playing this card
    var requirements: [Requirement] { get }

    /// cost on playing this card
//    var cost: Any? { get }

    /// required target to play this card
//    var target: Any? { get }
}

/// Function  defining constraints to play a card
public protocol Requirement {
    func match(_ ctx: Game) -> Result<Void, Error>
}

/// Function defining card side effects
public protocol Effect: Event {

    /// All attributes
    var attr: [String: Attribute] { get }
}
