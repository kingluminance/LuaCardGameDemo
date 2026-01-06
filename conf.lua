-- conf.lua
function love.conf(t)
    -- 1. 프로젝트 식별자 (중요!)
    -- Binser로 저장할 때 이 이름으로 된 폴더에 데이터가 저장됩니다.
    -- 위치: (Windows) %appdata%/Love/love-clicker-project/
    t.identity = "LuaCardGameDemo" 

    -- 2. 윈도우 설정
    t.window.title = "Lua Card Game Demo" -- 창 제목
    t.window.width = 1280                  -- 너비 (HD 해상도 추천)
    t.window.height = 720                  -- 높이
    t.window.resizable = false             -- 창 크기 조절 불가능 (UI 깨짐 방지)
    t.window.vsync = true                  -- 수직 동기화 (화면 찢어짐 방지)
    
    -- 3. 디버깅 설정 (매우 중요!)
    -- 개발 중에 print() 결과를 별도의 검은 콘솔창에서 볼 수 있게 해줍니다.
    -- 배포할 때는 false로 바꾸면 됩니다.
    t.console = true                       

    -- 4. 불필요한 모듈 끄기 (최적화)
    -- 카드/클릭커 게임에 필요 없는 물리 엔진이나 조이스틱 등을 끕니다.
    t.modules.physics = false              -- 물리 엔진 (사용 안 함)
    t.modules.joystick = false             -- 게임패드 (사용 안 함)
    t.modules.touch = false                -- 터치 (모바일 아니면 끔)
    t.modules.audio = true                 -- 오디오 (효과음은 필요하니 켜둠)
end