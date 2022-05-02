--renderer

--call method

local renderer_url = "https://raw.githubusercontent.com/287871/aimware_libraries/main/renderer.lua"

--loadstrin
if not renderer then
    http.Get(
        renderer_url,
        function(api)
            loadstring(api)()
        end
    )
end

--RunScript
if not renderer then
    local libraries_inspect
    file.Enumerate(
        function(filename)
            if filename == "libraries/renderer.lua" then
                libraries_inspect = true
            end
        end
    )
    if not libraries_inspect then
        http.Get(
            renderer_url,
            function(api)
                file.Write("libraries/renderer.lua", api)
            end
        )
    end
end
RunScript("libraries/renderer.lua")

--[[
    renderer.load_svg
syntax: renderer.load_svg(contents, width, height)
contents - SVG file contents
scale - Optional: SVG ratio, default is 1
Returns a texture and SVG information array form that can be used with renderer.texture, or nil on failure. It is not recommended to call in every frame
    ]]
local svg_data =
    [[<svg xmlns="http://www.w3.org/2000/svg" width="109.5" height="32"><path fill-rule="evenodd" clip-rule="evenodd" fill="#FFF" d="M109.289,11.317c0.052,0.129,0.104,0.256,0.155,0.385 c0.077,0.18,0.116,0.348,0.116,0.503c0,0.256-0.154,0.617-0.464,1.08l-0.115,0.193H67.997v0.695h3.01v2.624l0.424,0.425 c0.231,0.18,0.347,0.488,0.347,0.925c0,0.155-0.025,0.257-0.077,0.309c-0.052,0-0.078,0.039-0.078,0.116v0.116 c0,0.309-0.064,0.462-0.192,0.462c-0.077,0-0.193,0-0.347,0c-0.18,0-0.785,0-1.814,0c-0.977,0-2.521,0-4.631,0 c-2.11,0-5.119,0-9.03,0c-0.129,0.078-0.193,0.206-0.193,0.387c0.051,0,0.116,0.038,0.193,0.115l0.27,0.271l-0.193,0.579h-1.543 l-0.193-0.193c-0.077-0.128-0.244-0.515-0.501-1.158c-0.257-0.591-0.283-1.08-0.078-1.466c0-0.309,0.155-0.462,0.464-0.462h0.116 c0.644,0,1.042,0.09,1.197,0.27c0.36,0,0.785-0.103,1.273-0.308l-7.487-0.079c-0.051,0-0.372,0.091-0.964,0.271 c-0.514,0.128-1.105,0.297-1.774,0.501c-0.644,0.181-1.262,0.349-1.853,0.501c-0.541,0.129-0.836,0.232-0.888,0.31v2.701 l-8.836,0.926v-2.778c-0.463,0-0.746,0.063-0.849,0.192c-0.078,0.128-0.284,0.296-0.617,0.502 c-0.31,0.308-0.695,0.514-1.158,0.617c-0.515,0.18-1.107,0.232-1.775,0.154c-0.668-0.051-1.428-0.334-2.277-0.849 c-0.052,0-0.104,0.025-0.154,0.078c-0.077,0-0.18,0-0.309,0c0,0.333-0.013,0.732-0.038,1.196 c-0.051,0.514-0.142,1.029-0.27,1.543c-0.078,0.514-0.232,1.004-0.463,1.467c-0.154,0.411-0.334,0.668-0.54,0.771 c-0.361,0.207-0.966,0.271-1.815,0.193c-0.849-0.052-1.749-0.168-2.701-0.347c-0.951-0.129-1.827-0.271-2.624-0.425 c-0.796-0.232-1.286-0.398-1.466-0.501c-0.18-0.128-0.541-0.514-1.08-1.159c-0.386-0.308-0.773-0.656-1.159-1.042 c-0.385-0.334-0.629-0.514-0.732-0.54H9.532c-0.206,1.39-0.334,2.212-0.385,2.469c-0.026,0.206-0.104,0.309-0.232,0.309 c-0.076,0.18-0.231,0.271-0.463,0.271c-0.206,0-0.644-0.091-1.313-0.271c-0.514,0-1.029,0-1.542,0 c-0.541-0.026-0.876-0.026-1.003,0c-0.232,0-0.491,0.038-0.772,0.117c-0.335,0.102-0.733,0.167-1.197,0.193 c-0.361,0.127-0.771,0.218-1.236,0.269c-0.514,0.077-0.822,0.143-0.925,0.193H0.193c-0.077,0-0.115-0.039-0.115-0.116 C0.025,24.721,0,24.502,0,24.167c0-0.283,0-0.771,0-1.466c0-0.72,0-1.711,0-2.972c0.128-1.184,0.193-2.328,0.193-3.435 c0-1.183,0-2.032,0-2.547c0-0.205,0.258-0.424,0.772-0.654c0.463-0.207,1.607-0.285,3.435-0.233h1.003l0.077-0.077l0.117-0.077 c0.051,0,0.114-0.039,0.193-0.117c0.076-0.051,0.179-0.128,0.308-0.231h9.185c0.206,0.026,0.411,0.142,0.617,0.348 c0.464,0.308,0.811,0.655,1.042,1.041h10.419c0.078-0.205,0.18-0.527,0.309-0.964c0.129-0.386,0.193-0.708,0.193-0.964v-0.231 h0.078c0.283-0.103,0.785-0.193,1.504-0.27c0.694-0.025,1.107-0.104,1.235-0.232c0.128,0,0.258-0.026,0.386-0.077 c0.025-0.077,0.103-0.142,0.231-0.193h3.242V9.85h-1.196c-0.128,0-0.451,0.052-0.964,0.155c-0.515,0.077-1.133,0.153-1.853,0.231 c-0.668,0.076-1.39,0.142-2.161,0.193c-0.722,0-1.351-0.038-1.892-0.117l-0.077-0.192v-0.115 c-0.077-0.721-0.116-1.274-0.116-1.66c0-0.437,0-0.786,0-1.042c0-0.206,0.039-0.347,0.116-0.424l0.077-0.078h0.192l0.811-0.077 c0.566-0.026,1.184-0.064,1.853-0.116c0.72-0.077,1.441-0.115,2.161-0.115c0.668,0,1.183,0.038,1.542,0.115 c0.463,0,0.965,0,1.506,0c0.592,0,1.208,0,1.852,0c0.591,0,1.145-0.013,1.659-0.039c0.464-0.051,0.823-0.076,1.081-0.076V5.837 c-0.052-0.026-0.077-0.09-0.077-0.193V5.027l3.203-0.193h0.039l0.385,1.08c0,0.052-0.039,0.09-0.115,0.116 c-0.052,0.103-0.142,0.154-0.271,0.154v0.193h5.596c0.438-0.103,1.054-0.193,1.853-0.271c0.848-0.077,1.684-0.167,2.508-0.27 c0.848-0.077,1.633-0.141,2.354-0.193c0.669-0.026,1.092,0.026,1.273,0.155l0.154,0.115l0.077,4.399h-0.231 c-4.682,0-7.19-0.154-7.525-0.463v0.155c-0.18-0.104-0.541-0.167-1.081-0.193c-0.541-0.052-1.158-0.04-1.852,0.038v0.888h63.673 v0.154C109.148,11.021,109.212,11.162,109.289,11.317z M31.876,17.684h-2.161c-0.592,0-0.887,0.27-0.887,0.811 c0,0.644,0.295,0.965,0.887,0.965h2.161c0.591,0,0.888-0.321,0.888-0.965C32.765,17.954,32.468,17.684,31.876,17.684z M19.257,21.428c0.36,0.747,0.926,1.158,1.698,1.235c0.643,0.18,1.403,0.078,2.277-0.309c0.438-0.232,0.913-0.644,1.428-1.234 c0.179-0.334,0.308-0.721,0.386-1.158c0.077-0.515,0.026-0.914-0.155-1.197c-0.128-0.488-0.604-0.811-1.427-0.965 c-1.055-0.206-1.904-0.167-2.546,0.116c-0.438,0.231-0.746,0.424-0.927,0.579c-0.206,0.154-0.399,0.411-0.579,0.772 C19,19.936,18.948,20.655,19.257,21.428z"/></svg>]]
local svg_texture, svg_info = renderer.load_svg(svg_data, scale)

--[[
    renderer.load_png
syntax: renderer.load_png(contents)
contents - PNG file contents
Returns a texture and PNG information array form that can be used with renderer.texture, or nil on failure. It is not recommended to call in every frame
    ]]
renderer.load_png(contents)

--[[
    renderer.load_jpg
syntax: renderer.load_jpg(contents)
contents - JPG file contents
Returns a texture and JPG information array form that can be used with renderer.texture, or nil on failure. It is not recommended to call in every frame
    ]]
renderer.load_jpg(contents)

--Must be called in every frame callback
local function example()
    --[[
        renderer.screen_size
    syntax: renderer.screen_size()
    Returns (width, height).
    ]]
    local screen_size = {renderer.screen_size()}
    print(screen_size[1], screen_size[2])

    --[[
        renderer.texture
    syntax: renderer.texture(id, x, y, w, h, r, g, b, a, mode)
    id - Texture ID
    x - X screen coordinate
    y - Y screen coordinate
    w - Width
    h - Height
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (1-255)
    ]]
    renderer.texture(svg_texture, 200, 400, svg_info[2], svg_info[3], 255, 255, 255, 255)

    --[[
        renderer.color
    syntax: renderer.color(...)
    ... - Decimal or hexadecimal
    Returns r g b a, The color defaults to white when it fails or when it is nil
    ]]
    local r, g, b, a = renderer.color()
    print("color nil  " .. r, g, b, a)
    local r, g, b, a = renderer.color("#1e9af7ff")
    print("color hex  " .. r, g, b, a)
    local r, g, b, a = renderer.color(255, 0, 0, 255)
    print("color dec  " .. r, g, b, a)

    --[[
        renderer.measure_text
    syntax: renderer.measure_text(flags, ...)
    flags - "+" for large text, "-" for small text, or nil for normal sized text.
    ... - Text that will be measured
    Returns width, height.
    ]]
    print(renderer.measure_text("", "measure_text"))
    print(renderer.measure_text("-", "measure_text -"))
    print(renderer.measure_text("+", "measure_text +"))

    --[[
        renderer.text
    syntax: renderer.text(x, y, r, g, b, a, flags, max_width, ...)
    x - Screen coordinate
    y - Screen coordinate
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (0-255)
    flags - "+" for large text, "-" for small text, "s" for shaded text, "c" for centered text, "r" for right-aligned text, "b" for bold text, "d" for high DPI support. nil can be specified for normal sized uncentered text.
    ... - Text that will be drawn
    ]]
    renderer.text(100, 100, 255, 255, 255, 255, "-s", "renderer.text - s")
    renderer.text(100, 120, 255, 255, 255, 255, "+", "renderer.text +")

    --[[
        renderer.rectangle
    syntax: renderer.rectangle(x, y, w, h, r, g, b, a)
    x - Screen coordinate
    y - Screen coordinate
    w - Width in pixels
    h - Height in pixels
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (0-255)
    flags - "f" for filled rect, "o" for Outline rect, "s" for shaded rect.
    radius - Optional: shadow radius
    ]]
    renderer.rectangle(0, 0, 100, 100, 255, 255, 255, 255, "o")
    renderer.rectangle(0, 50, 100, 100, 255, 255, 255, 255, "s", 100)

    --[[
        renderer.line
    syntax: renderer.line(xa, ya, xb, yb, r, g, b, a)
    xa - Screen coordinate of point A
    ya - Screen coordinate of point A
    xb - Screen coordinate of point B
    yb - Screen coordinate of point B
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (0-255)
    ]]
    renderer.line(200, 0, 200, 100, 255, 255, 255, 255)

    --[[
        renderer.gradient
    syntax: renderer.gradient(x, y, w, h, r1, g1, b1, a1, r2, g2, b2, a2, ltr)
    x - Screen coordinate
    y - Screen coordinate
    w - Width in pixels
    h - Height in pixels
    r1 - Red (0-255)
    g1 - Green (0-255)
    b1 - Blue (0-255)
    a1 - Alpha (0-255)
    r2 - Red (0-255)
    g2 - Green (0-255)
    b2 - Blue (0-255)
    a2 - Alpha (0-255)
    ltr - Left to right. Pass true for horizontal gradient, or false for vertical.
    ]]
    renderer.gradient(0, 250, 50, 50, 255, 255, 255, 255, 255, 0, 0, 255, true)

    --[[
        renderer.rectangle
    syntax: renderer.rectangle(x, y, w, h, r, g, b, a)
    x - Screen coordinate
    y - Screen coordinate
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (0-255)
    radius - Radius of the circle in pixels.
    flags - "f" for filled circle, "o" for Outline circle.
    ]]
    renderer.circle(200, 100, 255, 255, 255, 255, 30, "o")

    --[[
        renderer.circle_outline
    syntax: renderer.circle_outline(x, y, r, g, b, a, radius, start_degrees, percentage, thickness, radian)
    x - Screen coordinate
    y - Screen coordinate
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (0-255)
    radius - Radius of the circle in pixels.
    start_degrees - 0 is the right side, 90 is the bottom, 180 is the left, 270 is the top.
    percentage - Must be within [0.0-1.0]. 1.0 is a full circle, 0.5 is a half circle, etc.
    thickness - Thickness of the outline in pixels.
    radian - Optional: Roundness
    ]]
    renderer.circle_outline(200, 200, 255, 255, 255, 255, 50, 180, -0.6, 5)
    renderer.circle_outline(200, 250, 255, 255, 255, 255, 50, 0, 0.6, 5, 30)

    --[[
    renderer.triangle
    syntax: renderer.triangle(x0, y0, x1, y1, x2, y2, r, g, b, a)
    x0 - Screen coordinate X for point A
    y0 - Screen coordinate Y for point A
    x1 - Screen coordinate X for point B
    y1 - Screen coordinate Y for point B
    x2 - Screen coordinate X for point C
    y2 - Screen coordinate Y for point C
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (0-255)
    ]]
    renderer.triangle(300, 100, 280, 120, 320, 120, 255, 255, 255, 255)

    --[[
        renderer.rectangle_rounded
    syntax: renderer.rectangle_rounded(x, y, w, h, r, g, b, a, radius, flags, tl, tr, bl, br)
    x - Screen coordinate
    y - Screen coordinate
    w - Width in pixels
    h - Height in pixels
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (0-255)
    radius - Radius of roundness
    flags - "f" for filled rectangle rounded, "o" for Outline rectangle rounded.
    tl - Optional: round top left corner
    tr - Optional: round top right corner
    bl - Optional: round bottom left corner
    br - Optional: round bottom right corner
    ]]
    renderer.rectangle_rounded(400, 0, 100, 100, 255, 255, 255, 255, 100, "o")
    renderer.rectangle_rounded(400, 120, 100, 100, 255, 255, 255, 255, 10, "f", 20, 20, 20, 20)

    --[[
        renderer.new_indicator
    syntax: renderer.new_indicator()
    To use the indicator, you must first call this
    ]]
    renderer.new_indicator()

    --[[
        renderer.indicator
    syntax: renderer.indicator(r, g, b, a, ...)
    r - Red (0-255)
    g - Green (0-255)
    b - Blue (0-255)
    a - Alpha (0-255)
    ... - The text that will be drawn
    You must call the indicator to use this
    ]]
    renderer.indicator(255, 255, 255, 255, "indicator")
    renderer.indicator(255, 255, 0, 255, "aim", "ware")
end

callbacks.Register("Draw", example)
