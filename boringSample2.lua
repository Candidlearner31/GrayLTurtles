write("How Far Down to Mine?")
local D = read()
write("How Far Over to Mine?")
local O = read()
write("What should be the size of the square?")
local L = read()
print(D.."x"..O)
local x, y = 0, 0


local function digSquare()
	for i = 1,1 do
		for i = 1,L do
			turtle.inspect()
			turtle.dig()
			turtle.forward()
		end
		turtle.turnRight()
		turtle.inspect()
		turtle.dig()
		turtle.forward()
		turtle.turnRight()
		for i = 1,L do
			turtle.inspect()
			turtle.dig()
			turtle.forward()
		end
		turtle.turnLeft()
		turtle.inspect()
		turtle.dig()
		turtle.forward()
		turtle.turnLeft()
		for i = 1,L do
			turtle.inspect()
			turtle.dig()
			turtle.forward()
		end
		turtle.turnRight()
		turtle.inspect()
		turtle.dig()
		turtle.forward()
		turtle.turnRight()
		for i = 1,L do
			turtle.inspect()
			turtle.dig()
			turtle.forward()
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
