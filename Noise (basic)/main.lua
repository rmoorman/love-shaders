backgroundFile = "bands.png"
background = nil
linearShader = nil
simpleShader = nil
triangularShader = nil
current = nil

function loadShader()
   local source = love.filesystem.read("linear-noise.fsh")
   linearShader = love.graphics.newShader(source)
   print(linearShader:getWarnings())
   
   source = love.filesystem.read("nonoise.fsh")
   simpleShader = love.graphics.newShader(source)
   print(simpleShader:getWarnings())

   source = love.filesystem.read("triangular-noise.fsh")
   triangularShader = love.graphics.newShader(source)
   print(triangularShader:getWarnings())

   current = linearShader
end

function love.load(args)
   loadShader()
   background = love.graphics.newImage(backgroundFile)
   love.window.setMode(1800, 400, {fullscreen = false})
   hdrCanvas = love.graphics.newCanvas(love.window.getWidth(), love.window.getHeight(), "hdr")
   local vertices = {
      {1800, 100, 0,   0},
      {1800,   0, 0,   0},
      {0,      0, .15, 0},
      {0,    100, .15, 0}
   }
   mesh = love.graphics.newMesh(vertices)
end


function love.draw()
   current:send("seed", {math.sin(love.timer.getTime()), math.cos(love.timer.getTime())})
   love.graphics.setColor(255, 255, 255, 255)
   love.graphics.setShader(current)
   love.graphics.draw(mesh)
   love.graphics.setShader(simpleShader)
   love.graphics.draw(mesh, 0, 100)
   love.graphics.setShader()
   
   love.graphics.setColor(0, 255, 0, 255)
   love.graphics.setShader(current)
   love.graphics.draw(mesh, 0, 200)
   love.graphics.setShader(simpleShader)
   love.graphics.draw(mesh, 0, 300)
   love.graphics.setShader()
   -- love.graphics.setShader(shader)
   -- love.graphics.draw(background)
   -- love.graphics.setShader()
end
   
function love.keypressed(key, isrepeat)
   if key == "l" then
      current = linearShader
   end
   if key == "t" then
      current = triangularShader
   end
end
