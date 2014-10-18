-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine = {
  addonName = "Probably",
  addonColor = "EE2200",
  version = "6.0.2r4"
}
DiesalLibs = true

function ProbablyEngine.print(message)
  print('|c00'..ProbablyEngine.addonColor..'['..ProbablyEngine.addonName..']|r ' .. message)
end
