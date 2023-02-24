import Foundation

let beer = Card("beer") {
    SideEffects {
        Heal(1)
    }
}

let stagecoach = Card("stagecoach") {
    SideEffects {
        Draw()
        Draw()
    }

}

let dynamite = Card("dynamite") {
    SideEffects {
        Luck("♥️") {
            Heal(1)
        } onFailure: {
            Damage(3)
        }
    }
}

let ctx = Game {
    Players {
        "suzzyLafayette"
        "vultureSam"
        Player("elGringo") {
            Health(2)
            Hand {
                "gatling"
                "missed"
            }
        }
    }
    Turn("elGringo")
    Deck {
        beer
        stagecoach
        dynamite
    }
}

print(ctx)

