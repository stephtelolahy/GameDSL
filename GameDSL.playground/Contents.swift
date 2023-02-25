import Foundation

let beer = CardImpl("beer") {
    Play {
        Heal(1)
    }
    .active {
        PlayerAtLeast(3)
    }
} attr: {
    Value("6♥️")
}

let stagecoach = CardImpl("stagecoach", actions: {
    Play {
        Draw()
        Draw()
    }
    .active()
})

let mustang = CardImpl("mustang") {
    Equip()
        .active()
}

let dynamite = CardImpl("dynamite", actions: {
    Handicap()
        .active()
    Luck("♥️") {
        Heal(1)
    } onFailure: {
        Damage(3)
    }
    .triggered {
        OnSetTurn()
    }
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
        dynamite
    }
}

print(ctx)

