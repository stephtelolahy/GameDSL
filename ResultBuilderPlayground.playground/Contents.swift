import Foundation

let beer = Card("beer") {
    Heal(1)
}

let stagecoach = Card("stagecoach") {
    for _ in (0..<2) {
        Draw()
    }
}

let dynamite = Card("dynamite") {
    Luck("♥️") {
        Heal(1)
    } onFailure: {
        Damage(3)
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
        dynamite
    }
}

print(ctx)

