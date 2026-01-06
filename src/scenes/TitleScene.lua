-- src/scenes/TitleScene.lua


local GameScene = require 'src.scenes.GameScene'

local TitleScene = Object:extend() -- classic 라이브러리로 클래스 생성!

-- 씬이 시작될때 한번 실행
function TitleScene:enter()
    print("TitleScene:enter() called")
    love.graphics.setBackgroundColor(0.1, 0.1, 0.2) -- 배경색 설정
end

--매프레임 실행
function TitleScene:update(dt)
    -- suit.Button("글자", x, y, 너비, 높이)
    -- 이 함수는 버튼이 그려질 위치를 잡고, 클릭 여부(.hit)를 반환합니다.
    if suit.Button("GAME START", 300, 300, 200, 50).hit then
        print("Start Button Clicked!")
        Gamestate.switch(GameScene)
    end

    if suit.Button("EXIT", 300, 370, 200, 50).hit then
        love.event.quit() -- 게임 종료
    end
end

-- 매프레임 실행 (그리기)
function TitleScene: draw()
    -- 타이틀 텍스트
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("LOCE CLICKER", 0, 150, 800, "center")
end

return TitleScene