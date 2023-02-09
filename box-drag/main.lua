function love.load()
    -- require statements
    require("code.keyboard")
    utils = require("code.util")

    -- setting up window
    Window_Width = 800
    Window_Height = 600

    love.window.setMode(Window_Width, Window_Height)
    love.window.setTitle("Drag The Box")
    love.window.setVSync(1)

    -- setting up shorthands
    graphics = love.graphics
    mouse = love.mouse

    -- Debug thingies
    Show_Debug = false

    -- Defining the box and mouse
    local box_orig_x = math.random(0, Window_Width)
    local box_orig_y = math.random(0, Window_Height)

    Red_Box = {
        x = box_orig_x,
        y = box_orig_y,

        color = utils.color_from_hex(255, 0, 0),

        hit_box = {
            x = box_orig_x,
            y = box_orig_y,

            h = 40,
            w  = 40
        }
    }

    Mouse = {
        x = mouse.getX(),
        y = mouse.getY(),

        is_down = false
    }
end

function love.update(dt)
    -- updating coords
    Mouse.x, Mouse.y = mouse.getX(), mouse.getY()
    Red_Box.hit_box.x, Red_Box.hit_box.y = Red_Box.x, Red_Box.y

    -- Allowing the box to move
    -- See: code/keyboard.lua
    if mouse.isDown(1) then
        if utils.is_col_mouse(Red_Box.hit_box, Mouse) then
            Mouse.is_down = true
        end
    end

    -- Moving the box
    if Mouse.is_down then
        Red_Box.x = Mouse.x - 20
        Red_Box.y = Mouse.y - 20
    end
end

function love.draw()
    graphics.setBackgroundColor(utils.color_from_hex(52, 136, 209))

    graphics.setColor(Red_Box.color)
        graphics.rectangle("fill", Red_Box.x, Red_Box.y, 40, 40)
    graphics.setColor(1, 1, 1)

    graphics.print({utils.color_from_hex(255, 255, 255, 0.4), "Press F1 to show debug info"}, 10, Window_Height - 20, 0)

    if Show_Debug then
        -- Drawing box hitbox
        graphics.rectangle("line", Red_Box.hit_box.x, Red_Box.hit_box.y, Red_Box.hit_box.w, Red_Box.hit_box.h)

        graphics.print("Colliding: " .. tostring(utils.is_col_mouse(Red_Box.hit_box, Mouse)), 10, 10, 0)
        graphics.print("Can Move: " .. tostring(Mouse.is_down), 10, 30, 0)
        graphics.print("X: " .. tostring(Mouse.x) .. "\nY: " .. tostring(Mouse.y), 10, 60, 0)
    end
end