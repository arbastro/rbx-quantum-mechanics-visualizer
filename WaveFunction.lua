local WaveFunction = {}
WaveFunction.__index = WaveFunction

--constructor
function WaveFunction.new(n, L, numPoints)
    local self = setmetatable({}, WaveFunction)
    self.n = n or 1
    self.L = L or 50
    self.numPoints = numPoints or 100

    self.waveFolder = Instance.new("Folder")
    self.waveFolder.Name = "WaveFunction"
    self.waveFolder.Parent = workspace

    return self
end

function WaveFunction:calculateWaveFunction(x)
    local psi = math.sqrt(2 / self.L) * math.sin((self.n * math.pi * x) / self.L)
    return psi
end

function WaveFunction:createWaveGraph()
    for _, child in pairs(self.waveFolder:GetChildren()) do
        child:Destroy()
    end

    local dx = self.L / self.numPoints
    for i = 0, self.numPoints do
        local x = i * dx --x position
        local psi = self:calculateWaveFunction(x) --y position (wave value)

        --wave point
        local part = Instance.new("Part")
        part.Size = Vector3.new(0.5, 0.5, 0.5)
        part.Position = Vector3.new(x - self.L / 2, psi * 10, 0)
        part.Anchored = true
        part.Color = Color3.fromRGB(0, 255, 255)
        part.Parent = self.waveFolder

        local mesh = Instance.new("SpecialMesh", part)
        mesh.MeshType = Enum.MeshType.Sphere
        mesh.Scale = Vector3.new(0.5, 0.5, 0.5)
    end
end

function WaveFunction:updateWaveGraph(newN)
    self.n = newN
    self:createWaveGraph()
end

return WaveFunction
