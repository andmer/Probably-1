-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

-- Functions that require FireHack

local function Distance(a, b)
    if UnitExists(a) and UnitIsVisible(a) and UnitExists(b) and UnitIsVisible(b) then
        local ax, ay, az = ObjectPosition(a)
        local bx, by, bz = ObjectPosition(b)
        local ab = (UnitCombatReach(a))
        local bb = (UnitCombatReach(b))
        local b = ab + bb
        return math.sqrt(((bx-ax)^2) + ((by-ay)^2) + ((bz-az)^2)) - b
    end
    return 0
end

function UnitsAroundUnit(unit, distance)
    if FireHack then
        local total = 0
        local totalObjects = ObjectCount()
        local onUnit = UnitExists(unit)
        for i = 1, totalObjects do
            local object = ObjectWithIndex(i)
            if ObjectType(object) == 9 and not UnitIsPlayer(object) and not UnitIsUnit(object, unit) then
                local reaction = UnitReaction("player", object)
                local combat = UnitAffectingCombat(object)
                if reaction and reaction <= 4 and combat then
                    if onUnit then
                        local objDistance = math.abs(Distance(object, unit))
                        if objDistance <= distance then
                            total = total + 1
                        end
                    else
                        total = total + 1
                    end
                end
            end
        end
        return total + 1
    else
        return 0
    end
end