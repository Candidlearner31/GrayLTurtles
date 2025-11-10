
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
local function forwardcheck()
    local function checkRightLeft()
        turtle.forward()
        turtle.turnRight()
        local nothing = turtle.detect()
        if nothing == false then
            turtle.turnLeft()
            turtle.turnLeft()
            local check = turtle.detect()
            if check == false then
                turtle.turnRight()
                turtle.turnRight()
            else
                turtle.turnRight()
                turtle.turnRight()
            end
        else 
            turtle.turnLeft()
            turtle.turnLeft()
            local check2 = turtle.detect()
            if check2 == false then
                print("yes")
            else
                turtle.turnRight()
                turtle.turnRight()
            end    
        end
    end
    local function checkForwards()
        turtle.forward()
        turtle.turnRight()
        local checkRight = turtle.detect()
        if checkRight == false then
            turtle.turnLeft()
            turtle.turnLeft()
            local checkLeft = turtle.detect()
            if checkLeft == false then
                turtle.turnRight()
                turtle.turnRight()
            else
                turtle.turnRight()
            end
        else
            turtle.turnLeft()
            turtle.turnLeft()
            local checkLeft2 = turtle.detect()
            if checkLeft2 == false then
                print("Hello")
            else
                turtle.turnRight()
            end
         end
     end
    local ok, data = turtle.inspect()
    if ok and data.name:find("Birch") then
    turtle.turnRight()
    end
    if ok and data.name:find("sandstone") then
        turtle.forward()
         checkRightLeft()
    else
        checkForwards()
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

    -- Idea:
    -- While we dect a block
    -- forward, turn right.
    forwardcheck()
end
