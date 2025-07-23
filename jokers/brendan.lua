-- region Brendan
SMODS.Joker{
	-- name = "Brendan",
	key = "Brendan",
	atlas = "j_cbpunk_jokers",
	config = {
		extra = {
			chance = 3,
			round = -1
		}
	},
	pos = {x = 2, y = 0},
    pixel_size = { w = 71, h = 95 },
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
    description = "1 in 3 chance for a booster pack to be free.",
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chance, G.GAME.probabilities.normal}}
    end,

    calculate = function(self, card, context)
		if G.shop and card.ability.extra.round ~= G.GAME.round then
			local done = 0
			for k, v in pairs(G.shop_booster.cards) do
                if (pseudorandom("cbpunk_brendan") < G.GAME.probabilities.normal/card.ability.extra.chance) then
					v.ability.couponed = true
					v:set_cost()
					done = done + 1
				end
            end
			card.ability.extra.round = G.GAME.round
			if done ~= 0 then 
				if done == 1 then return { message = "Freebie!" } end
				return {message = "Freebie! x"..done}
			end

		end
    end
}
-- endregion Brendan