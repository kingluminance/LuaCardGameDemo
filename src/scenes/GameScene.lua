-- src/scenes/GameScene.lua
local CardDatabase = require 'src.data.CardDatabase'
local PlayerData = require 'src.data.PlayerData'

local GameScene = Object:extend()

function GameScene:enter()
    print("Game Scene Entered")
    love.graphics.setBackgroundColor(0.2, 0.4, 0.2) -- 초록색 배경
    self.hand = {} -- 현재 손에 든 카드 목록
    -- 예시: 'strike' 카드를 3장 생성해서 손패에 추가
    table.insert(self.hand, CardDatabase:createCard('dummy'))
    table.insert(self.hand, CardDatabase:createCard('dummy'))
    table.insert(self.hand, CardDatabase:createCard('dummy'))
end

function GameScene:update(dt)
    -- 뒤로가기 버튼
    if suit.Button("BACK TO TITLE", 10, 10, 150, 30).hit then
        Gamestate.switch(require 'src.scenes.TitleScene')
    end

    local cardToRemove = nil -- 사용 후 버릴 카드의 인덱스

    for i, card in ipairs(self.hand) do
        -- 카드 위치 계산 (가로로 나열)
        local x = 50 + (i-1) * 110
        local y = 400

        -- 카드의 UI 함수 호출
        -- 만약 버튼이 클릭되었다면(true) 내부 로직 실행
        if card:updateUI(x, y) then
            if PlayerData:payCost(card.cost) then
                card:onUse()
                cardToRemove = i -- 루프 도중 삭제하면 꼬일 수 있으니 인덱스 저장
            else
                print("코스트 부족!")
            end
        end
    end

    -- 사용한 카드 삭제 처리
    if cardToRemove then
        table.remove(self.hand, cardToRemove)
    end
end

function GameScene:draw()
    -- 1. 현재 코스트 표시 (화면 좌측 하단 등)
    love.graphics.setColor(1, 1, 0) -- 노란색
    love.graphics.print("COST: " .. PlayerData.currentCost, 50, 650)
    love.graphics.setColor(1, 1, 1) -- 색상 초기화
   
end


return GameScene