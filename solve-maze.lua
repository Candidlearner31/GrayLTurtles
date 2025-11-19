
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

local function placeBlockBehind()
    turtle.forward()
    turtle.select(1)
    turtle.turnRight()
    turtle.turnRight()
    turtle.place()
    turtle.turnRight()
    turtle.turnRight()
end

local function forwardcheck()
    local function checkRightLeft()
        
        
        local ForwardCheck1 = turtle.detect()
        if ForwardCheck1 == false then
            turtle.turnRight()
            local nothing1 = turtle.detect()
            if nothing1 == false then
                turtle.turnLeft()
                turtle.turnLeft()
                local check1 = turtle.detect()
                if check1 == false then
                    turtle.turnRight()
                
                else
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
                
                end    
            end
        else
            turtle.turnRight()
            local nothing2 = turtle.detect()
            if nothing2 == false then
                turtle.turnLeft()
                turtle.turnLeft()
                local check3 = turtle.detect()
                if check3 == false then
                    turtle.turnRight()
                    turtle.turnRight()
                
                else
                    turtle.turnRight()
                    turtle.turnRight()
                
                end
            else 
                turtle.turnLeft()
                turtle.turnLeft()
                local check4 = turtle.detect()
                if check4 == false then
                    print("yes")
                else
                    turtle.turnRight()
                    turtle.turnRight()
                
                end    
            end
        end
    end

    local function checkForwards()
        
        
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
    if data.name == ("minecraft:stone") then
        print("stone")
        turtle.dig()
    end
    if ok and data.name:find("stone") then
        print("Found sandstone")
        placeBlockBehind()
        checkRightLeft()
        
    else
        placeBlockBehind()   
        checkRightLeft()   
        
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
