import Foundation

// MARK: - Abilities

let endTurn = Card("endTurn") {
    Group {
        Repeat(NumExcessHand()) {
            Discard(card: CardSelectHand())
        }
        SetTurn(player: PlayerNext())
    }
    .active()
}

let draw2CardsOnSetTurn = Card("draw2CardsOnSetTurn") {
    Repeat(2) {
        Draw()
    }
    .triggered {
        OnSetTurn()
    }
}

let eliminateOnLooseLastHealth = Card("eliminateOnLooseLastHealth") {
    Eliminate()
        .triggered {
            OnLooseLastHealth()
        }
}

let setGameOverOnEliminated = Card("setGameOverOnEliminated") {
    SetGameOver()
        .triggered {
            OnEliminated()
            IsGameOver()
        }
}

// MARK: - Collectible

let beer = Card("beer") {
    Play {
        Heal(1)
    }
    .active {
        IsPlayersAtLeast(3)
    }
}

let saloon = Card("saloon") {
    Play {
        Heal(1, player: PlayerDamaged())
    }
    .active()
}

let stagecoach = Card("stagecoach") {
    Play {
        Repeat(2) {
            Draw()
        }
    }
    .active()
}

let wellsFargo = Card("wellsFargo") {
    Play {
        Repeat(3) {
            Draw()
        }
    }
    .active()
}

let duel = Card("duel") {
    Play(target: PlayerSelectAny()) {
        Damage(1)
    }
    .active()
}

let mustang = Card("mustang") {
    Equip()
        .active()
}

let jail = Card("jail") {
    Handicap(target: PlayerSelectAny())
        .active()
}

let dynamite = Card("dynamite") {
    Equip()
        .active()
    
    Luck("♥️") {
        Heal(1)
    } onFailure: {
        Damage(3)
    }
    .triggered {
        OnSetTurn()
    }
}

let ctx = Game {
    Players {
        "suzzyLafayette"
        "vultureSam"
        Player("elGringo") {
            Health(2)
            Abilities {
                endTurn
                draw2CardsOnSetTurn
                eliminateOnLooseLastHealth
                setGameOverOnEliminated
            }
            Hand {
                "gatling"
                "missed"
            }
        }
    }
    Turn("elGringo")
    Deck {
        beer.attr { Value("6♥️") }
        saloon
        stagecoach
        dynamite
        duel
        Card("secret").attr { Value("J♣️") }
    }
}

let engine = CardGameEngine(ctx, rule: BangRule())

print(ctx)


/*
 enum CardList {

     static let collectibles: [CardImpl] = [
         .init(name: .generalStore,
               playMode: PlayAction(),
               onPlay: [Repeat(times: NumPlayers(),
                               effect: Store()),
                        DrawStore(player: PlayerAll(),
                                  card: CardSelectStore())]),
         .init(name: .catBalou,
               playMode: PlayAction(),
               playTarget: PlayerSelectAny(),
               onPlay: [Discard(player: PlayerTarget(),
                                card: CardSelectAny())]),
         .init(name: .panic,
               playMode: PlayAction(),
               playTarget: PlayerSelectAt(1),
               onPlay: [Steal(target: PlayerTarget(),
                              card: CardSelectAny())]),
         .init(name: .bang,
               playMode: PlayAction(),
               playTarget: PlayerSelectReachable(),
               canPlay: [IsTimesPerTurn(1)],
               onPlay: [ForceDiscard(player: PlayerTarget(),
                                     card: CardSelectHandNamed(.missed),
                                     otherwise: [Damage(player: PlayerTarget(), value: 1)])]),
         .init(name: .missed),
         .init(name: .gatling,
               playMode: PlayAction(),
               onPlay: [ForceDiscard(player: PlayerOthers(),
                                     card: CardSelectHandNamed(.missed),
                                     otherwise: [Damage(player: PlayerTarget(), value: 1)])]),
         .init(name: .indians,
               playMode: PlayAction(),
               onPlay: [ForceDiscard(player: PlayerOthers(),
                                     card: CardSelectHandNamed(.bang),
                                     otherwise: [Damage(player: PlayerTarget(), value: 1)])]),
         .init(name: .duel,
               playMode: PlayAction(),
               playTarget: PlayerSelectAny(),
               onPlay: [ChallengeDiscard(player: PlayerTarget(),
                                         challenger: PlayerActor(),
                                         card: CardSelectHandNamed(.bang),
                                         otherwise: [Damage(player: PlayerTarget(), value: 1)])]),
         .init(name: .barrel,
               playMode: PlayEquipment(),
               canPlay: [IsNotHavingSameCardInPlay()],
               triggers: [OnForceDiscardHandNamed(.missed)],
               onTrigger: [Luck(regex: CardRegex.successfulBarrel,
                                onSuccess: [Cancel()])]),
         .init(name: .jail,
               playMode: PlayHandicap(),
               playTarget: PlayerSelectAny(),
               canPlay: [IsTargetNotHavingSameCardInPlay()],
               triggers: [OnSetTurn()],
               onTrigger: [Luck(regex: CardRegex.escapeFromJail,
                                onSuccess: [Discard(card: CardPlayed())],
                                onFailure: [Discard(card: CardPlayed()),
                                            SetTurn(player: PlayerNext())])]),
         .init(name: .dynamite,
               playMode: PlayHandicap(),
               playTarget: PlayerSelectAny(),
               triggers: [OnSetTurn()],
               onTrigger: [Luck(regex: CardRegex.passDynamite,
                                onSuccess: [PassInPlay(card: CardPlayed(), target: PlayerNext())],
                                onFailure: [Damage(value: 3),
                                            Discard(card: CardPlayed())])]),
         .init(name: .mustang,
               playMode: PlayEquipment()),
         .init(name: .scope,
               playMode: PlayEquipment()),
         .init(name: .schofield,
               playMode: PlayEquipment()),
         .init(name: .remington,
               playMode: PlayEquipment()),
         .init(name: .revCarabine,
               playMode: PlayEquipment()),
         .init(name: .winchester,
               playMode: PlayEquipment()),
         .init(name: .volcanic,
               playMode: PlayEquipment())
     ]

     static let figures: [CardImpl] = [
         .init(name: .willyTheKid),
         .init(name: .roseDoolan),
         .init(name: .paulRegret),
         .init(name: .jourdonnais),
         .init(name: .slabTheKiller),
         .init(name: .luckyDuke),
         .init(name: .calamityJanet),
         .init(name: .bartCassidy),
         .init(name: .elGringo),
         .init(name: .suzyLafayette),
         .init(name: .vultureSam),
         .init(name: .sidKetchum),
         .init(name: .blackJack),
         .init(name: .kitCarlson),
         .init(name: .jesseJones),
         .init(name: .pedroRamirez)
     ]

     static let cardSets: [String: [String]] = [
         .barrel: ["Q♠️", "K♠️"],
         .dynamite: ["2♥️"],
         .jail: ["J♠️", "10♠️", "4♥️"],
         .mustang: ["8♥️", "9♥️"],
         .remington: ["K♣️"],
         .revCarabine: ["A♣️"],
         .schofield: ["K♠️", "J♣️", "Q♣️"],
         .scope: ["A♠️"],
         .volcanic: ["10♠️", "10♣️"],
         .winchester: ["8♠️"],
         .bang: ["A♠️", "2♦️", "3♦️", "4♦️", "5♦️", "6♦️", "7♦️", "8♦️", "9♦️", "10♦️", "J♦️", "Q♦️", "K♦️", "A♦️", "2♣️", "3♣️", "4♣️", "5♣️", "6♣️", "7♣️", "8♣️", "9♣️", "Q♥️", "K♥️", "A♥️"],
         .missed: ["10♣️", "J♣️", "Q♣️", "K♣️", "A♣️", "2♠️", "3♠️", "4♠️", "5♠️", "6♠️", "7♠️", "8♠️"],
         .beer: ["6♥️", "7♥️", "8♥️", "9♥️", "10♥️", "J♥️"],
         .catBalou: ["K♥️", "9♦️", "10♦️", "J♦️"],
         .duel: ["Q♦️", "J♠️", "8♣️"],
         .gatling: ["10♥️"],
         .generalStore: ["9♣️", "Q♠️"],
         .indians: ["K♦️", "A♦️"],
         .panic: ["J♥️", "Q♥️", "A♥️", "8♦️"],
         .saloon: ["5♥️"],
         .stagecoach: ["9♠️", "9♠️"],
         .wellsFargo: ["3♥️"]
     ]
 }
 */
