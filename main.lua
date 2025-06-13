--- STEAMODDED HEADER
--- MOD_NAME: Cybalatropunk
--- MOD_ID: Cybalatropunk
--- MOD_AUTHOR: [Jules (the-white-cloud)]
--- MOD_DESCRIPTION: Adds Cyberpunk 2077 inspired Jokers and other stuff.
--- PREFIX: cbpunk
-----------------------------------------
-----------------Mod Code----------------


SMODS.Atlas{
    key = 'j_cbpunk_jokers',
    path = 'misty_joker.png',
    px = 71,
    py = 95
}

SMODS.Joker{
	name = "j_cbpunk_Misty",
	key = "misty",
	config = {extra = {Xmult = 1, Xmult_scale = 0.25}},
	pos = {x = 0, y = 0},
	rarity = 3,
	cost = 7,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	atlas = "j_cbpunk_jokers",
	credit = {
		art = "Jules (the-white-cloud)",
		code = "Jules (the-white-cloud)",
		concept = "Jules (the-white-cloud)"
	},
    description = "Gains +0.25 XMult per tarot card used this run.",
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_scale}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and (context.consumeable.ability.set == "Tarot") then
            card.ability.extra.XMult = 1 + card.ability.extra.Xmult_scale * G.GAME.consumeable_usage_total.tarot
        end

        if context.joker_main then
            c = 1 + card.ability.extra.Xmult_scale * G.GAME.consumeable_usage_total.tarot
            if c ~= 1 then
                return {
                    card = card,
                    Xmult_mod = c,
                    message = 'x' .. c,
                    colour = G.C.MULT
                }
            end
        end
    end
}