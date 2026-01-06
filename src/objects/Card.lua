
local Card = Object:extend()

function Card:new(id, name, cost, description)
    self.id = id or "unknown"
    self.name = name or "Unnamed Card"
    self.cost = cost or 0
    self.description = description or "No description."
    -- self.image = love.graphics.newImage("assets/cards/" .. self.id .. ".png") or nil
end

-- [!] 핵심: UI 업데이트 및 그리기 등록 함수
-- 이 함수는 GameScene의 update에서 호출됩니다.
function Card:updateUI(x, y, idx)
    -- 1. 버튼의 모양과 위치 정의
    -- Make a unique string id for SUIT so multiple cards don't share the same id
    local idstr = "card_" .. (self.id or "unknown") .. "_" .. (idx or "0")

    local btnState = suit.Button(self.name .. "\n(" .. self.cost .. ")", {
        id = idstr,
        align = "center",
        valign = "center"
    }, x, y, 100, 150)

    -- 2. 마우스를 올렸을 때 툴팁(설명)을 상태로 저장 (그리기는 draw에서 처리)
    if btnState.hovered then
        self.tooltip = { text = self.description, x = x, y = y - 20 }
    else
        self.tooltip = nil
    end

    -- 3. 클릭 되었는지 여부 반환 (.hit)
    return btnState.hit
end

function Card:onUse(target)
    print(self.name .. " 사용됨!")
end

return Card