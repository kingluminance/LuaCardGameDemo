
-- 싱글톤(Singleton)처럼 사용
local PlayerData = Object:extend()

function PlayerData:new()
    self:reset()
end

function PlayerData:reset()
   self.currentCost = 40;
end

-- 돈 사용 (성공하면 true, 부족하면 false 반환)
function PlayerData:payCost(amount)
    if self.currentCost >= amount then
        self.currentCost = self.currentCost - amount
        return true -- 구매/사용 성공
    else
        print("코스트가 부족합니다!") -- 디버깅용
        return false -- 실패
    end
end


return PlayerData()