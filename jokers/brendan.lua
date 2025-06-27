-- region Brendan
SMODS.Joker{
	-- name = "Brendan",
	key = "Brendan",
	atlas = "j_cbpunk_jokers",
	config = {
		extra = {
			chance = 4,
			round = 0,
		},
	},
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
        return {vars = {card.ability.extra.chance}}
    end,

    calculate = function(self, card, context)
		if G.shop and (card.ability.extra.round ~= G.round) then
			card.ability.extra.round = G.round
			for k, v in pairs(G.shop_booster.cards) do
                if (math.random(card.ability.extra.chance) == 1) then
					v.ability.couponed = true
					v:set_cost()
					card_eval_status_text(card, 'extra chance', 0, nil, nil, {message = "Take this!"})
				end
            end
		end
		
    end
}
-- endregion Brendan