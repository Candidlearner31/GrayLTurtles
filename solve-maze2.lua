
local function victory()
    print("We finished the maze!")
    turtle.up()
    for _ = 1,4 do
        turtle.turnRight()
    end    
end

local function look()
    local ok, data = turtle.inspectDown()
    
    if ok and data.name:find("green") then
        print("At start")
    end
    
    if ok and data.name:find("yellow") then
      victory()
      return true
    end  
    
    return false
end
local function forwardright()
    local check = turtle.detect()
    if not check then
        turtle.turnRight()
        local rightcheck = turtle.detect()
        if rightcheck then
            turtle.turnLeft()
            turtle.forward()
        else
            turtle.forward()
        end
    else
        turtle.turnRight()
        local rightcheck = turtle.detect()
        if rightcheck then
            turtle.turnLeft()
            turtle.turnLeft()
            local leftcheck = turtle.detect()
            if leftcheck then
                turtle.turnLeft()
            else
                turtle.forward()
            end
        else
            turtle.forward()
        end
    end
end


turtle.refuel(10)
if turtle.getFuelLevel() < 10 then
    print("Insert fuel in slot 1")
    return
end

while true do
    local done = look()
    if done then
        return
    end
    forwardright()
end
