import Foundation

let beer = RealCard("beer") {
    SideEffects {
        Heal(1)
    }
}

let stagecoach = RealCard("stagecoach") {
    SideEffects {
        Draw()
        Draw()
    }
}

let dynamite = RealCard("dynamite") {
    SideEffects {
        Luck("♥️") {
            Heal(1)
        } onFailure: {
            Damage(3)
        }
    }
}

let elGringo = RealPlayer("elGringo") {
    Health(2)
    Hand {
        "gatling"
        "missed"
    }
}

let ctx = RealGame {
    Players {
        "suzzyLafayette"
        "vultureSam"
        elGringo
    }
    Turn("elGringo")
    Deck {
        beer
        stagecoach
        dynamite
    }
}

print(ctx)

