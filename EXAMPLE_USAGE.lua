local WaveFunctionModule = require(game.ReplicatedStorage:WaitForChild("WaveFunction", math.huge))

--making wave function object
local waveFunction = WaveFunctionModule.new(1, 50, 100) --u can customize n, L, numPoints
local graphRep = math.huge --how many times u want to do it, math.huge is for infinite
local waitTime = 0 --how much time u want to wait in between each graph update

--generating initial wave graph
waveFunction:createWaveGraph()

--update graph over time w/ changing quantum numbers
for quantumNumber = 1, graphRep do
    task.wait(waitTime)
    waveFunction:updateWaveGraph(quantumNumber)
end
