local CardDatabase = {}

--여기에 카드 등록
--키는 카드 Id, 값은 클래스 자체로 저장
CardDatabase.classes = {
    strike = require 'src.objects.cards.Strike',
    dummy = require 'src.objects.cards.Dummy',
    --여기에 다른 카드들도 추가
}

function CardDatabase:createCard(id)
    local CardClass = self.classes[id]
    if CardClass then
        return CardClass()
    else
        error("Card ID '" .. id .. "' not found in CardDatabase.")
    end
end

-- 전체 카드 목록의 키(ID)만 가져오기 (랜덤 뽑기 등을 위해)
function CardDatabase:getAllIds()
    local ids = {}
    for id, _ in pairs(self.classes) do
        table.insert(ids, id)
    end
    return ids
end

return CardDatabase