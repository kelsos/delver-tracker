print('Running Delver\'s call Tracker')

local questIds = {758;759;2648;2649;766;2664;769;767;768;2667;771;770;2666}

local function showCompletedDelves()
    for _,i in ipairs(questIds) do i=i+83000
        local title = C_QuestLog.GetTitleForQuestID(i)
        local completed = C_QuestLog.IsQuestFlaggedCompleted(i)
        if not completed then
            print(format("%s (%d): %s",title,i, completed and "\124cff00ff00Yes\124r" or "\124cffff0000No\124r"))
        end
    end
end


SLASH_DELVERTRACKER1 = "/delves"
SlashCmdList["DELVERTRACKER"] = showCompletedDelves
