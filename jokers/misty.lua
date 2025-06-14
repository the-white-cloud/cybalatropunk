-- region Misty
SMODS.Joker{
	-- name = "Misty",
	key = "Misty",
	atlas = "j_cbpunk_jokers",
	config = {extra = 0.25, x_mult = 1},
	pos = {x = 0, y = 0},
	rarity = 3,
	cost = 6,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    credit = {
		art = "Jules (the-white-cloud)",
		code = "Jules (the-white-cloud)",
		concept = "Jules (the-white-cloud)"
	},
    description = "Gains +0.25 XMult per tarot card used while held.",
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.x_mult, card.ability.extra}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and (context.consumeable.ability.set == "Tarot") then
            card.ability.x_mult = card.ability.x_mult + card.ability.extra
            G.E_MANAGER:add_event(
            Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}}})
                    return true
                end
            }))
            return
                
        end
        if context.joker_main then
            if card.ability.Xmult ~= 1 then
                return {
                    card = card,
                    Xmult_mod = card.ability.x_mult,
                    message = 'x' .. card.ability.x_mult,
                    colour = G.C.MULT
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability", ref_value = "x_mult", retrigger_type = "exp" }
                    }
                }
            }
        }
    end
}
-- endregion Misty