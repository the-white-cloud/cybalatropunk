-- region Charles Wilson
SMODS.Joker{
	key = "Charles_Wilson",
	atlas = "j_cbpunk_jokers",
	config = {
        extra = {
            used_this_round = false,
            amount = 0.7, -- target is 70% of original / prev (e.g. reduced by 30%)
            cost = 5 -- dollars needed to trigger
        }
    },
	pos = {x = 3, y = 0},
    pixel_size = { w = 71, h = 85},
	rarity = 2,
	cost = 7,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
    credit = {
		art = "Jules (the-white-cloud)",
		code = "Jules (the-white-cloud)",
		concept = "Jules (the-white-cloud)"
	},
    description = "costs $5 per use, reduces target of current blind by 30%, once per blind",
    loc_vars = function(self, info_queue, card)
        local used = ""
        if (card.ability.extra.used_this_round) then
            used = "Active"
        else
            used = "Inactive"
        end


        return {vars = {card.ability.extra.cost, 100 * (1-card.ability.extra.amount), used}}
    end,

    calculate = function(self, card, context)
        
    end
}
-- endregion Charles Wilson