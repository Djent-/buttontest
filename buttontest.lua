button = {}
buttons = {}

a = {{"A", true}, {"B", true}, {"C", true}}

function button:new(x, y, width, height, ID)
	local self = {}
	self.x = x
	self.y = y
	self.height = height
	self.width = width
	self.ID = ID
	self._function = function(self)
			for x = 1, #a do
				if a[x][1] ~= self.ID then
					a[x][2] = false
				end
			end
		end
	return self
end

function click(x, y)
	for b = 1, #buttons do
		print(#buttons)
		if buttons[b].x <= x and buttons[b].y <= y then
			print("Attempt click " .. b)
			if buttons[b].width + buttons[b].x >= x and buttons[b].height + buttons[b].y >= y then
				buttons[b]:_function()
				print("Clicked button " .. b)
			end
		end
	end
end

function printA()
	for x = 1, #a do
		print(a[x][1], a[x][2])
	end
end

buttons[1] = button:new(1,1,5,5,"A")
buttons[2] = button:new(10,1,5,5,"B")
buttons[3] = button:new(6,1,5,5,"C")

click(2,2)

printA()
