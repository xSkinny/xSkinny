wait() do
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.name == "potion" then
            v.Parent = game.Players.LocalPlayer.Character
        end
    end
end
