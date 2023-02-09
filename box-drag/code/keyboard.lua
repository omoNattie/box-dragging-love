function love.mousereleased(x, y, button)
    -- stop the box from moving
    if button == 1 then
        Mouse.is_down = false
    end
end

function love.keypressed(key, scancode, isrepeat)
    if key == "f1" then
        Show_Debug = not Show_Debug
    end
end