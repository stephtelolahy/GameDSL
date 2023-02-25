import Foundation

/*

 let beer = Card("beer") {
    Heal(1)
        .activated {
            PlayerAtLeast(3)
        }
 })

 let bang = Card("bang") {
    ForceDiscard(target: PlayerTarget(),
                 card: CardSelectHandNamed(.missed),
                 otherwise: Damage(1, player: PlayerTarget()))
        .activated {
            IsMaxTimesPerTurn(1)
        }
        .target(PlayerSelectReachable())
        .cost(1)
 }

 let dynamite = Card("dynamite") {
    Damage(3)
        .triggered {
            OnStartTurn()
    }
 }

 */

let beer = CardImpl("beer") {
    CardActionImpl {
        Heal(1)
    }
    .active {
        PlayerAtLeast(3)
    }
}

let stagecoach = CardImpl("stagecoach", actions: {
    CardActionImpl {
        Draw()
    }
    .active()
})

let dynamite = CardImpl("dynamite", actions: {
    CardActionImpl {
        Luck("♥️") {
            Heal(1)
        } onFailure: {
            Damage(3)
        }
    }
    .triggered()
})

let elGringo = PlayerImpl("elGringo") {
    Health(2)
    Hand {
        "gatling"
        "missed"
    }
}

let ctx = GameImpl {
    "suzzyLafayette"
    "vultureSam"
    elGringo
} attr: {
    Turn("elGringo")
    Deck {
        beer
        stagecoach
//        dynamite
    }
}

print(ctx)

