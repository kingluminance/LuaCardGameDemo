-- main.lua

-- 1. 라이브러리 로드 (전역 변수로 선언해서 어디서든 쓰게 함)
Object = require 'lib.classic'
Gamestate = require 'lib.hump.gamestate'
Timer = require 'lib.hump.timer'
Binser = require 'lib.binser'
suit = require 'lib.suit'

-- 1-1. 게임 데이터 로드
local PlayerData = require 'src.data.PlayerData'

-- 2. 초기화
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.math.setRandomSeed(os.time())
    -- 시작 씬으로 전환
    local TitleScene = require 'src.scenes.TitleScene'
    Gamestate.switch(TitleScene)

    -- 한글 폰트 설정
    -- 1. 폰트 로드
    local krFont = love.graphics.newFont("assets/fonts/나눔고딕/NanumGothic.otf", 20)
    -- 2. LÖVE 기본 폰트로 설정 (love.graphics.print 등에 적용)
    love.graphics.setFont(krFont)
    -- 3. SUIT UI 폰트로 설정 (suit 위젯들에 적용)
    suit.theme.font = krFont 
end

-- 3. 메인 루프 연결 (HUMP Gamestate가 알아서 다 해줌)
function love.update(dt)
    Timer.update(dt)     -- 타이머 갱신
    Gamestate.update(dt) -- 현재 씬 업데이트
end

function love.draw()
    Gamestate.draw()     -- 현재 씬 그리기
    suit.draw()          -- UI 그리기 (맨 위에 그려야 클릭됨)
end

-- 4. 입력 연결
function love.mousepressed(x, y, button)
    Gamestate.mousepressed(x, y, button)
end

function love.keypressed(key)
    Gamestate.keypressed(key)
end

-- 텍스트 입력 (한글이나 아이디 입력할 때 필요)
function love.textinput(t)
    suit.textinput(t)
end