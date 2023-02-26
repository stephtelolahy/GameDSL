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

/// Generating events for engine's loop
public protocol EngineRule {
    func triggered(_ ctx: Game) -> [Event]?
    func active(_ ctx: Game) -> [Event]?
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

    /// is Game over
    var isOver: Bool { get }

    /// All attributes
    var attr: [String: Attribute] { get }

    /// last occurred event
    var event: Result<Event, Error>? { get set }
}

/// Any card, player, game attribute
/// Expected to be unique
public protocol Attribute {

    /// attribute name
    var name: String { get }
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

    /// Card unique identifier
    var id: String { get }

    /// Actions that can be performed with the card
    var actions: [CardAction] { get }

    /// All attributes
    var attr: [String: Attribute] { get }
}

/// Function defining card side effects
public protocol CardAction {

    /// Side effect on dispatching action
    var effect: Effect { get }

    /// The manner an action is dispatched
    var type: CardActionType { get }

    /// requirements for playing this card
    var requirements: [Requirement] { get }
}

public enum CardActionType {

    /// card is active when your turn and requirments are met
    /// then you can choose to play it
    case active

    /// the side effects are applyed as soon as requirements are met
    case triggered
}

/// Function  defining constraints to play a card
public protocol Requirement {
    func match(_ ctx: Game) -> Result<Void, Error>
}

public protocol Effect: Event {

    /// Resolving context
    var ctx: [String: Attribute] { get set }
}
