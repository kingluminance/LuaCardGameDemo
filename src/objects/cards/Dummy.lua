local Card = require 'src.objects.Card'

local Dummy = Card:extend()

function Dummy:new()
    Dummy.super.new(self, "dummy", "더미 카드", 3, "아무런 효과도 없습니다, 버리세요 !")
end

function Dummy:onUse()
   -- 더미 카드는 아무 효과도 없습니다.
   print(self.name .. " 카드는 아무 효과도 없습니다.")
end


return Dummy
