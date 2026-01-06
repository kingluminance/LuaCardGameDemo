-- src/scenes/GameScene.lua

local GameScene = Object:extend()

function GameScene:enter()
    print("Game Scene Entered")
    love.graphics.setBackgroundColor(0.2, 0.4, 0.2) -- 초록색 배경
end

function GameScene:update(dt)
    -- 뒤로가기 버튼
    if suit.Button("BACK TO TITLE", 10, 10, 150, 30).hit then
        Gamestate.switch(require 'src.scenes.TitleScene')
    end
end

function GameScene:draw()
    love.graphics.print("GAME START!", 350, 300)
end

return GameScene