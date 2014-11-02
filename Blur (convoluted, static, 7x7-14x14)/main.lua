backgroundFile = "Cappadocia_Balloon_Inflating_Wikimedia_Commons.JPG"
background = nil
horizontalShader = nil
verticalShader = nil
canvas = nil

function gaussian(x)
   sigma = 0.84089642
   return (1/(sigma*math.sqrt(2*math.pi)))
      * math.exp((-x*x)/(2*sigma*sigma))
end

function loadShader()
   local horizontalVertexSource = love.filesystem.read("material-horizontal.vsh")
   local verticalVertexSource = love.filesystem.read("material-vertical.vsh")
   local fragmentSource = love.filesystem.read("material.fsh")
   horizontalShader = love.graphics.newShader(horizontalVertexSource, fragmentSource)
   verticalShader = love.graphics.newShader(verticalVertexSource, fragmentSource)
   print(horizontalShader:getWarnings())
   print(verticalShader:getWarnings())
end

function love.load(args)
   background = love.graphics.newImage(backgroundFile)
   love.window.setMode(background:getWidth(), background:getHeight(), {fullscreen = false})
   loadShader()
   canvas = love.graphics.newCanvas()
   for i = 0,3 do
      local val = 0.708
      print(tostring(i) .. ": " .. tostring(gaussian(val*i)*gaussian(val*i)))
   end
end


function love.draw()
   love.graphics.setCanvas(canvas)
   love.graphics.setShader(horizontalShader)
   love.graphics.draw(background)
   love.graphics.setShader()
   love.graphics.setCanvas()
   love.graphics.setShader(verticalShader)
   love.graphics.draw(canvas)
   love.graphics.setShader()
end
