local HttpService = game:GetService("HttpService") 
local Players = game:GetService("Players") 
 
local Notify_Webhook = "https://discord.com/api/webhooks/1334852755470417940/6j86kxJGrk6jtBjLBL8yXCakcYfCNdquYmjOhYePTUSUd4f3i64sf7jrplyMWaCytOpQ" -- Вставь свой вебхук 
 
local player = Players.LocalPlayer 
 
local send_data = { 
    ["content"] = "Игрок запустил скрипт!", 
    ["embeds"] = { 
        { 
            ["title"] = "Данные игрока", 
            ["description"] = "Никнейм: " .. player.Name .. "\nUserId: " .. player.UserId .. "", 
            ["color"] = 16711680, -- Красный цвет 
            ["footer"] = { 
                ["text"] = "Roblox Log", 
                ["icon_url"] = "https://tr.rbxcdn.com/84b4a1c9c066546c1587f3c9f2ae8822/150/150/Image/Png" 
            }, 
            ["thumbnail"] = { 
                ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png" 
            } 
        } 
    } 
} 
 
local headers = { 
    ["Content-Type"] = "application/json" 
} 
 
pcall(function() 
    request({ 
        Url = Notify_Webhook, 
        Method = "POST", 
        Headers = headers, 
        Body = HttpService:JSONEncode(send_data) 
    }) 
end)
