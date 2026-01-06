local Card = require 'src.objects.Card'

local Strike = Card:extend()

function Strike:new()
    --부모 클래스 생성자 호출
    Strike.super.new(self, "strike", "강타", 1, "적에게 10의 피해를 줍니다.")
end

function Strike:onUse(target)
    -- 실제 공격 로직
    if target and target.takeDamage then
        target:takeDamage(10)
    end
    -- 부모의 로그 출력 기능도 유지하고 싶다면:
    Strike.super.onUse(self, target)
end

return Strike