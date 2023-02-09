local utils = {}

function utils.color_from_hex(r, g, b, a)
    --- Transform rgb values from 0..255 to 0..1
    -- Takes 0..255 value and divides it by 255, returning a value between 0 and 1

    -- default param
    a = a or 1

    local color = {r/255, g/255, b/255, a}

    return color
end

function utils.is_col_mouse(box, mouse)
    --- Check if a box is colliding with mouse coordinates.

    local min_x = math.max(box.x, mouse.x)
    local min_y = math.max(box.y, mouse.y)

    local max_x = math.min(box.x + box.w, mouse.x)
    local max_y = math.min(box.y + box.h, mouse.y)

    if min_x <= max_x and min_y <= max_y then
        return true
    end

    return false
end

return utils