import Foundation

let beer = CardImpl("beer") {
    Play {
        Heal(1)
    }
    .active {
        PlayerAtLeast(3)
    }
}

let stagecoach = CardImpl("stagecoach") {
    Play {
        Draw()
        Draw()
    }
    .active()
}

let mustang = CardImpl("mustang") {
    Equip()
        .active()
}

let jail = CardImpl("jail") {
    Handicap()
        .target(PlayerSelectAny())
        .active()
}

let dynamite = CardImpl("dynamite") {
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

let elGringo = PlayerImpl("elGringo") {
    Health(2)
    Hand {
        "gatling"
        "missed"
    }
}

let ctx = GameImpl {
    Players {
        "suzzyLafayette"
        "vultureSam"
        elGringo
    }
    Turn("elGringo")
    Deck {
        beer.attr { Value("6♥️") }
        stagecoach
        dynamite
        CardImpl("secret").attr { Value("J♣️") }
    }
}

print(ctx)
