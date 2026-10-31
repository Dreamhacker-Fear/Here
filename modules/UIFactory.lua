-- Shared UI constructors. Pass the palette and TweenService from the entry point.
return function(COLORS, TweenService)
    local function make(class, props, parent)
        local o = Instance.new(class)
        for k, v in pairs(props or {}) do o[k] = v end
        o.Parent = parent
        return o
    end

    local function round(obj, r)
        make("UICorner", { CornerRadius = UDim.new(0, r or 6) }, obj)
    end

    local function circle(obj)
        make("UICorner", { CornerRadius = UDim.new(0.5, 0) }, obj)
    end

    local function stroke(obj, color, thick, trans)
        return make("UIStroke", {
            Color = color or COLORS.white,
            Thickness = thick or 1,
            Transparency = trans or 0,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }, obj)
    end

    local function tween(obj, dur, goal, style, dir)
        local t = TweenService:Create(obj,
            TweenInfo.new(dur, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), goal)
        t:Play()
        return t
    end

    local function label(parent, text, size, pos, ts, color, bold)
        return make("TextLabel", {
            BackgroundTransparency = 1,
            Text = text,
            Size = size,
            Position = pos,
            Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham,
            TextSize = ts or 12,
            TextColor3 = color or COLORS.white,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextWrapped = true,
        }, parent)
    end

    local function button(parent, text, size, pos, color, ts)
        local o = make("TextButton", {
            Size = size,
            Position = pos,
            BackgroundColor3 = color or COLORS.card,
            BorderSizePixel = 0,
            Text = text,
            TextColor3 = COLORS.white,
            TextSize = ts or 12,
            Font = Enum.Font.GothamMedium,
            TextWrapped = true,
            AutoButtonColor = true,
        }, parent)
        round(o, 5)
        return o
    end

    return {
        make = make, round = round, circle = circle, stroke = stroke,
        tween = tween, label = label, button = button,
    }
end
