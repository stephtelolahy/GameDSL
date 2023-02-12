import Foundation


var ctx = Game {
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
        Card("beer") {
            Value("6♥️")
        }
    }
}

print(ctx)

