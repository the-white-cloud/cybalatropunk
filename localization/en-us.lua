-- Welcome to en-us.lua!
-- friendly reminder that in the us we say things like "color" and not "colour"

--Progress report: Not done

return {
    descriptions = {
        Joker = {
            j_cbpunk_Misty = {
                name = "Misty",
                text = {
                    "This Joker gains",
                    "{X:mult,C:white} X#2# {} Mult every time",
                    "a {C:tarot}Tarot{} card is used",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                }
            },
            j_cbpunk_Bill_Mitchel = {
                name = "Bill Mitchel",
                text = {
                    "This Joker gains",
                    "{C:red} +1{} Mult every time",
                    "a card gets destroyed.",
                    "{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult)",
                }
            },
            j_cbpunk_Brendan = {
                name = "Brendan",
                text = {
                    "{C:green}#2# in #1#{} chance to",
                    "make a {C:attention}Booster Pack{} free."
                }
            },
            j_cbpunk_Charles_Wilson = {
                name = "Charles Wilson",
                text = {
                    "Bribe to look the other way.",
                    "(Once a blind, you can pay {C:money}$#1#{}",
                    "to reduce blind target by {C:attention}#2#%{})",
                    "{C:inactive}(Currently {C:attention}#3#{C:inactive}){}"
                }
            }
        }
    }
}
