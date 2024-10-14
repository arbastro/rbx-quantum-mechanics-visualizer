# rbx-quantum-mechanics-visualizer
A quantum mechanics visualizer module with live-updating graph - uses a simple version of the particle in a box wave function.
---
# `WaveFunction` Module

Simulates the wave function of a particle in a one-dimensional box, based on quantum mechanics - allows for the visualization of the wave function by plotting it using part orbs. The wave function changes based on the quantum number and the box length, which gives dynamic way to visualize quantum states (for roblox)
----
## Simulation Video
##### https://github.com/user-attachments/assets/fe004e60-afb8-4ff6-9479-12ed2c711f4a

## Creator Store Model
##### https://create.roblox.com/store/asset/115005313943668
----
## Features
- Simulates wave functions for different quantum numbers
- Customizable box length and number of points
- Visualizes the wave function as a 3D graph

## Constructor
`WaveFunction.new(n, L, numPoints)`  
Creates a new wave function object with the following parameters:
- `n`: The quantum number (default: 1).
- `L`: The length of the box (default: 50).
- `numPoints`: The number of points to use for plotting the wave function (default: 100).

## Methods
### `WaveFunction:calculateWaveFunction(x)`
Calculates the wave function value (`ψ`) at a given `x` position in the box

### `WaveFunction:createWaveGraph()`
Generates the wave graph by creating part orbs at each point along the box based on the calculated wave function

### `WaveFunction:updateWaveGraph(newN)`
Updates the wave graph for a new quantum number `n` which regenerates the graph with updated values

## Example Usage

```lua
local WaveFunctionModule = require(game.ReplicatedStorage:WaitForChild("WaveFunction", math.huge))

--making wave function object
local waveFunction = WaveFunctionModule.new(1, 50, 100) --u can customize n, L, numPoints
local graphRep = math.huge --how many times u want to do it, math.huge is for infinite
local waitTime = 1 --how much time u want to wait in between each graph update

--generating initial wave graph
waveFunction:createWaveGraph()

--update graph over time w/ changing quantum numbers
for quantumNumber = 1, graphRep do
	task.wait(waitTime)
	waveFunction:updateWaveGraph(quantumNumber)
end
```

## How It Works
- **Wave function calculation**: I calculate the wave function using this formula:  
  `ψ(x) = sqrt(2 / L) * sin((n * pi * x) / L)`
- **Graph creation**: Creates part orbs to represent each point on the wave graph.
- **Dynamic updates**: Via looping through quantum numbers, the graph updates in real-time, which simulates different quantum states.

## Customization
- **Quantum Number (`n`)**: This is to represent different quantum states, you can change this value to your preference.
- **Box Length (`L`)**: This is to adjust the length of the box to simulate different spatial environments, you can change this value to your preference.
- **Number of Points**: This is to control the number of plotted points to refine the graph's resolution, you can change this value to your preference.

## Installation
1. Add this `ModuleScript` to your project (e.g., under `ReplicatedStorage`).
2. Require the module in your game scripts and start visualizing the quantum mechanics wave functions!

## License
This module is open-source and free to use under the MIT License.

##### looking for contributions
