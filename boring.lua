write("How Far Down to Mine?")
local D = read()
write("How Far Over to Mine?")
local O = read()
print(D.."x"..O)
local x, y = 0, 0
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
Return()
