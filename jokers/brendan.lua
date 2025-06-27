-- region Brendan
SMODS.Joker{
	-- name = "Brendan",
	key = "Brendan",
	atlas = "j_cbpunk_jokers",
	config = {extra = 4,},
	pos = {x = 2, y = 0},
    pixel_size = { w = 71, h = 95},
	rarity = 3,
	cost = 7,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    credit = {
		art = "Jules (the-white-cloud)",
		code = "Jules (the-white-cloud)",
		concept = "Jules (the-white-cloud)"
	},
    description = "1 in 4 chance for a booster pack to be free.",
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, card.ability.extra}}
    end,

    calculate = function(self, card, context)
    end
}
-- endregion Brendan