print('Running Delver\'s call Tracker')

local questIdBase = 83000
local questIds = {758;759;2648;2649;766;2664;769;767;768;2667;771;770;2666}

local frame = CreateFrame("Frame")
frame:SetScript('OnEvent', function(self, event, arg1)
    if (event == 'QUEST_TURNED_IN') then
        local questId = arg1

        local completedID
        local remainingCalls = 0

        for _,i in ipairs(questIds) do i=i+questIdBase
            if i == questId then
              completedID = i
            end
            local completed = C_QuestLog.IsQuestFlaggedCompleted(i)
            if not completed then
                remainingCalls = remainingCalls + 1
            end
        end

        if completedID then
            local title = C_QuestLog.GetTitleForQuestID(questId)
            print(format("%s competed. remaining delver's calls %d", title, remainingCalls))
        end
    end

end);

frame:RegisterEvent('QUEST_TURNED_IN')

local function showCompletedDelves()
    for _,i in ipairs(questIds) do i=i+questIdBase
        local title = C_QuestLog.GetTitleForQuestID(i)
        local completed = C_QuestLog.IsQuestFlaggedCompleted(i)
        if not completed then
            print(format("%s (%d): %s",title,i, completed and "\124cff00ff00Yes\124r" or "\124cffff0000No\124r"))
        end
    end
end


SLASH_DELVERTRACKER1 = "/delves"
SlashCmdList["DELVERTRACKER"] = showCompletedDelves
