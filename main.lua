--- STEAMODDED HEADER
--- MOD_NAME: Cybalatropunk
--- MOD_ID: Cybalatropunk
--- MOD_AUTHOR: [Jules (the-white-cloud)]
--- MOD_DESCRIPTION: Adds Cyberpunk 2077 inspired Jokers and other stuff.
--- PREFIX: cbpunk
-----------------------------------------
-----------------Mod Code----------------


SMODS.Atlas{
    key = 'Jokers',
    path = 'misty_joker.png',
    px = 71,
    py = 95
}


SMODS.Joker{
    key = 'misty_cbpunk',
    loc_txt = {
        name = "Misty",
        text = {
            'Gains x0.25 mult per tarot card used\
            starts with x1 mult'
        }
    },
    atlas = 'Jokers',
    pos = {x = 0, y = 0},
    config = {
        extra = {
            Xmult = 1
        }
    },
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.Xmult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            c = 1 + 0.25 * G.GAME.consumeable_usage_total.tarot
            return {
                card = card,
                Xmult_mod = c,
                message = 'x' .. c,
                colour = G.C.MULT
            }
        end
    end
}

