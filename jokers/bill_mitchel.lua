-- region Bill Mitchel
SMODS.Joker{
	-- name = "Misty",
	key = "Bill_Mitchel",
	atlas = "j_cbpunk_jokers",
	config = {mult = 0, extra = 1},
	pos = {x = 1, y = 0},
	rarity = 1,
	cost = 2,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    credit = {
		art = "Jules (the-white-cloud)",
		code = "Jules (the-white-cloud)",
		concept = "Jules (the-white-cloud)"
	},
    description = "Gains +1 Mult per card destroyed while held.",
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.mult}}
    end,

    calculate = function(self, card, context)
        if context.cards_destroyed and not context.blueprint then
            local destroyed_cards = 0
            for k, v in ipairs(context.glass_shattered) do
                if v.shattered then
                    destroyed_cards = destroyed_cards + 1
                end
            end
            if destroyed_cards > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            card.ability.mult = card.ability.mult + card.ability.extra*destroyed_cards
                            return true
                        end
                    }))
                    card_eval_status_text(card, 'mult', card.ability.mult + card.ability.extra*destroyed_cards, nil, nil, {message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.mult + card.ability.extra*destroyed_cards}}})
                    return true
                    end
                }))
            end
            return  
        end

        if context.remove_playing_cards and not context.blueprint then
            local destroyed_cards = 0
            for k, v in ipairs(context.removed) do
                destroyed_cards = destroyed_cards + 1
            end
            if destroyed_cards > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = function()
                            card.ability.mult = card.ability.mult + card.ability.extra*destroyed_cards
                            return true
                        end
                    }))
                    card_eval_status_text(card, 'mult', card.ability.mult + card.ability.extra*destroyed_cards, nil, nil, {message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.mult + card.ability.extra*destroyed_cards}}})
                    return true
                    end
                }))
            end
        end

        if context.joker_main then
            if card.ability.mult ~= 0 then
                return {
                    card = card,
                    mult_mod = card.ability.mult,
                    message = 'x' .. card.ability.mult,
                    colour = G.C.MULT
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return  {
            text = {
                { text = "+" },
                { ref_table = "card.ability", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                card.joker_display_values.mult = G.GAME and G.GAME.consumeable_usage_total and
                    G.GAME.consumeable_usage_total.tarot or 0
            end
        }
    end
}
-- endregion Bill Mitchel