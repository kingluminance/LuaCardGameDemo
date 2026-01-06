
local Card = Object:extend()

function Card:new(id, name, cost, description)
    self.id = id or "unknown"
    self.name = name or "Unnamed Card"
    self.cost = cost or 0
    self.description = description or "No description."
    -- self.image = love.graphics.newImage("assets/cards/" .. self.id .. ".png") or nil
end

function Card:onUse(target)
    -- Default behavior when the card is used
    print(self.name .. " used on ")
end

function Card:draw(x,y)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", x, y, 100, 150)
    love.graphics.print(self.name, x + 5, y + 5)
    love.graphics.print("Cost: " .. self.cost, x + 5, y + 20)
    love.graphics.printf(self.description, x + 5, y + 50, 90, "left")
end

return Card