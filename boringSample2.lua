write("How Far Down to Mine?")
local D = read()
write("How Far Over to Mine?")
local O = read()
write("What should be the size of the square?")
local L = read()
print(D.."x"..O)
local x, y = 0, 0
local stone,granite,diorite,andesite,coal,copper,lapis,redstone,diamond,gold,emerald = 0,0,0,0,0,0,0,0,0,0,0

local function savedata()
    -- turtle.inspectDown() returns (true, data) or (false, reason)
    local ok, data = turtle.inspect()

    if ok and data then
        -- Use data.name:find() and increment the correct counter
        local blockName = data.name:lower() -- Use lower() for more reliable matching


        if blockName:find("granite") then
            granite = granite + 1
        elseif blockName:find("diorite") then
            diorite = diorite + 1
        elseif blockName:find("andesite") then
            andesite = andesite + 1
        elseif blockName:find("coal") then
            coal = coal + 1
        elseif blockName:find("copper") then
            copper = copper + 1
        elseif blockName:find("lapis") then
            lapis = lapis + 1
        elseif blockName:find("redstone") then
            redstone = redstone + 1
        elseif blockName:find("diamond") then
            diamond = diamond + 1
        elseif blockName:find("gold") then
            gold = gold + 1
        elseif blockName:find("emerald") then
            emerald = emerald + 1
        elseif blockName:find("stone") then
            stone = stone + 1
        end
    end
end

local function refuelWithCoal()
    local initialFuel = turtle.getFuelLevel()
    local maxFuel = turtle.getFuelLimit()

    if maxFuel ~= -1 and initialFuel >= maxFuel then
        print("Fuel already full.")
        return
    end

    print("Checking inventory for fuel...")
    local refueled = false

    -- Iterate through all 16 slots
    for i = 1, 16 do
        local item = turtle.getItemDetail(i)
        -- Check if the item is 'coal'. We only check for the item name, not quantity.
        if item and item.name:find("coal") then
            turtle.select(i)
            -- turtle.refuel() uses the selected item
            local success, reason = turtle.refuel()

            if success then
                refueled = true
                print("Refueled using coal from slot "..i..".")
            end

            -- Stop if the fuel tank is now full
            if maxFuel ~= -1 and turtle.getFuelLevel() >= maxFuel then
                break
            end
        end
    end

    -- Restore selection to slot 1
    turtle.select(1)

    if refueled then
        print("Refueling complete. Fuel level: "..turtle.getFuelLevel())
    else
        print("No coal found or fuel tank is full.")
    end
end

local function checkFuel()
    -- Only check if the turtle is not in Creative mode (where limit is -1)
    if turtle.getFuelLimit() ~= -1 then
        local currentFuel = turtle.getFuelLevel()
        local lowFuelThreshold = 50 -- Refuel if fuel drops below 50

        if currentFuel < lowFuelThreshold then
            print("Low fuel detected ("..currentFuel.."). Refueling...")
            refuelWithCoal()
        end
    end
end
local function isInventoryFull()
    -- Checks if there is at least one empty slot (count 0)
    for i = 1, 16 do
        if turtle.getItemCount(i) == 0 then
            return false -- Found an empty slot, not full
        end
    end
    return true -- No empty slots found, inventory is full
end

local function dropAll()
    print("Inventory full. Dropping all items down...")
    for i = 1, 16 do
        -- Select the slot, then drop the entire stack down
        turtle.select(i)
        turtle.dropDown()
    end
    -- Select the first slot again for general use
    turtle.select(1)
    print("Drop complete. Resuming mine.")
end

local function checkAndDrop()
    if isInventoryFull() then
        dropAll()
    end
end

local function digSquare()
	for i = 1,1 do
		for i = 1,L do
			savedata()
			turtle.dig()
			turtle.forward()
			checkAndDrop()
			checkFuel()
		end
		turtle.turnRight()
		savedata()
		turtle.dig()
		turtle.forward()
		turtle.turnRight()
		for i = 1,L do
			savedata()
			turtle.dig()
			turtle.forward()
			checkAndDrop()
			checkFuel()
		end
		turtle.turnLeft()
		savedata()
		turtle.dig()
		turtle.forward()
		turtle.turnLeft()
		for i = 1,L do
			savedata()
			turtle.dig()
			turtle.forward()
			checkAndDrop()
			checkFuel()
		end
		turtle.turnRight()
		savedata()
		turtle.dig()
		turtle.forward()
		turtle.turnRight()
		for i = 1,L do
			savedata()
			turtle.dig()
			turtle.forward()
			checkAndDrop()
			checkFuel()
		end
		turtle.turnRight()
		for i = 1,4 do
			turtle.forward()
		end
		turtle.turnRight()
		
		
		
	end 
end		

local function BoreDown()
    turtle.digDown()
    turtle.down()
    x = x + 1
end
local function BoreForward()
    turtle.dig()
    turtle.forward()
    y = y + 1
end
local function Boring()
    for i = 1,D do
        BoreDown()
    end
    for i = 1,O do
        BoreForward()
    end
end
local function Return()
    for i = 1,y do
        turtle.back()
    end
    for i = 1,x do
        turtle.up()
    end
end
Boring()
digSquare()
Return()
print("Stone:"..stone.." Granite:"..granite.." Diorite:"..diorite.." Andesite:"..andesite.." Coal:"..coal.." Copper:"..copper.." Lapis:"..lapis.." Redstone:"..redstone.." Diamond:"..diamond.." Gold:"..gold.." Emerald:"..emerald)
