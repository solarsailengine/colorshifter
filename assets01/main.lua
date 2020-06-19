local red = 0
local green = 0
local blue = 0
local velocity = nil
local counter = 0
local STARTINGCOUNTER = 60

local display1 = engine.display.getdisplaybyindex(0)
local window1 = engine.display.createwindow(display1, display1.left, display1.top, display1.width, display1.height)
local viewport1 = engine.display.newviewport(window1, 0, 0, display1.width, display1.height)

engine.display.setwindowtitle(window1, "Color Shifter")
engine.display.showwindow(window1)

local function getNumber()
	return engine.math.random(0, 128) / 255
end

local function makeVelocity()
	return {r = getNumber(), g = getNumber(), b = getNumber()}
end

function engine.update(dt)
	counter = counter - dt
	if counter < 0 then
		velocity = makeVelocity()
		counter = STARTINGCOUNTER
	end

	red = red + (velocity.r * dt)
	if (red > 1.0) or (red < 0.0) then
		velocity.r = -velocity.r
	end

	green = green + (velocity.g * dt)
	if (green > 1.0) or (green < 0.0) then
		velocity.g = -velocity.g
	end

	blue = blue + (velocity.b * dt)
	if (blue > 1.0) or (blue < 0.0) then
		velocity.b = -0.1
	end

	engine.display.setclearcolor(window1, red, green, blue, 1.0)
end

function engine.keyboard(buffer)
	if (buffer == 'q') then
		engine.requestshutdown()
	end
end
