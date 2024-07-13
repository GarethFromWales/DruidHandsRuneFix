-- Druid Hands Rune Fix
-- by NerfedWar
--
-- currently only supports Mangle and Sunfire which are the main issues feral druids seem to have
-- supporting Skull Bash and Wild Growth will take a lot more work as it's a lot more difficult to
-- determine whether to update a macro with Mangle(Cat) or Mangle(Bear) when switching from Skull Bash
-- to Mangle.

local EventFrame = CreateFrame("frame", "DHRFEventFrame")
DHRFEventFrame:RegisterEvent("SPELLS_CHANGED");

DHRFEventFrame:SetScript("OnEvent", function(self, event, ...)
	if(event == "SPELLS_CHANGED") then
		-- spellbook has been updated, could be a new spell, change of rune, change of item with rune attached
        -- seems to be the most reliable event as RUNE_CHANGED gets called oto often.

        -- get the name of the current Hands Rune Ability
        local currentHandsRune = nil
        local handsRunes = {
            [1] = "Mangle(Cat)",
            [2] = "Sunfire(Cat)",
            [3] = "Mangle(Bear)",
            [4] = "Sunfire(Bear)"
        }

        for _, handsRune in ipairs(handsRunes) do
            local name, rank, icon, castTime, minRange, maxRange, spellID, originalIcon = GetSpellInfo(handsRune)
            if spellID ~= undefined then
                currentHandsRune = handsRune
                break
            end
        end

        if currentHandsRune ~= nil then
            -- loop through all macros replacing any Hands Rune ability with the current hands rune
            for i = 1, 138 do
                name, iconTexture, body, isLocal = GetMacroInfo(i)
                if name ~= nil then
                    local mName, mTexture, mBody, isLocal  = GetMacroInfo(i)
                    local nBody = mBody

                    -- >> Mangle
                    if string.find(currentHandsRune, "Mangle") then
                        nBody = nBody:gsub("Sunfire%(", "Mangle(")
                    -- >> Sunfire
                    elseif string.find(currentHandsRune, "Sunfire") then
                        nBody = nBody:gsub("Mangle%(", "Sunfire(")
                    end

                    EditMacro(i, mName, nil, nBody, true)
                end
            end
        end
	end
end)