import Foundation

let beer = Card("beer") {
    Value("6♥️")
    OnPlay {
        Heal(1)
    }
}

let dynamite = Card("dynamite") {
    OnPlay {
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
        dynamite
    }
}

print(ctx)

