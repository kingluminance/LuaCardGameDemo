-- src/scenes/GameScene.lua
local CardDatabase = require 'src.data.CardDatabase'

local GameScene = Object:extend()

function GameScene:enter()
    print("Game Scene Entered")
    love.graphics.setBackgroundColor(0.2, 0.4, 0.2) -- 초록색 배경
    self.hand = {} -- 현재 손에 든 카드 목록
    -- 예시: 'strike' 카드를 3장 생성해서 손패에 추가
    table.insert(self.hand, CardDatabase:createCard('strike'))
    table.insert(self.hand, CardDatabase:createCard('strike'))
    table.insert(self.hand, CardDatabase:createCard('dummy'))
end

function GameScene:update(dt)
    -- 뒤로가기 버튼
    if suit.Button("BACK TO TITLE", 10, 10, 150, 30).hit then
        Gamestate.switch(require 'src.scenes.TitleScene')
    end
end

function GameScene:draw()
    -- 손패에 있는 카드들을 나열해서 그리기
    for i, card in ipairs(self.hand) do
        card:draw(50 + (i-1) * 110, 400)
    end
end


return GameScene