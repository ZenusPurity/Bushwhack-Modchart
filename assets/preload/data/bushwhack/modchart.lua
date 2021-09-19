-- 1.24secs per section 
-- 0.62secs per section/2 
-- 0.31secs per section/4
-- 0.07secs per section/16

local swayDefault = false 
local swayDefaultABitFaster = false 
local swayCentreZardy = false 
local swayCentreBF = false 
local swayZardyDefault = false
local distractionZardy = false 
local distraction1 = false 
local distraction2 = false 

local swayCableCentre320To55 = false 
local swayCableCentre480To55 = false 

local arrowFadingSlow = false 
local arrowFaded = false 
local arrowFadingFast = false 

local zardyFading = false 
local zardyFaded = false 

local arrowBeatSpin = false 
local arrowSpun1 = false 
local arrowSpun2 = false 
local arrowSpun3 = false 

local waitForStepFade = false 
local waitForStepZardyFade = false 
local waitForStepArrowSpin = false 
local waitForCableCentreStep = false 
local waitForCableCentreStep2 = false 

local note = null
local receptor = null
local R0 = null 
local R1 = null 
local R2 = null 
local R3 = null 
local R4 = null 
local R5 = null 
local R6 = null 
local R7 = null 

local currentBeat = null

function songStart() -- dont mind this i forgot i start off the notes invisible
    R0 = _G['receptor_0']
    R1 = _G['receptor_1']
    R2 = _G['receptor_2']
    R3 = _G['receptor_3']
    R4 = _G['receptor_4']
    R5 = _G['receptor_5']
    R6 = _G['receptor_6']
    R7 = _G['receptor_7']

    R0:tweenAlpha(1, 2.48)
    R7:tweenAlpha(1, 2.48)
end

function start(song)
    spinLength = 0 
    swayLength = 320
    swayLength2 = 420
end

function returnP1()
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.31)
    end
end

function returnP2()
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 0.31)
    end
end

function centreP1()
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX + 320, receptor.defaultY, 0.31)
    end
end

function centreP2()
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX - 320, receptor.defaultY, 0.31)
    end
end

function primeSemiMiddle()
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX + 160, receptor.defaultY, 0.31)
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX - 160, receptor.defaultY, 0.31)
    end
end

function dieP1()
    if downscroll then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 120, receptor.defaultY - 280, 0.31)
        end
    else 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX - 120, receptor.defaultY + 280, 0.31)
        end
    end
end

function primeDistractionZardy()
    if downscroll then 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 280, 0.31)
        end
    else 
        for i = 0, 3 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 280, 0.31)
        end
    end
end

function primeDistraction()
    if downscroll then 
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 120, receptor.defaultY - 280, 0.31)
        end
    else
        for i = 4, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX + 120, receptor.defaultY + 280, 0.31)
        end
    end
end

function spin1()
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 80, 0.31)
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 80, 0.31)
    end
end

function spin2()
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX + 640, receptor.defaultY - 80, 0.31)
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX - 640, receptor.defaultY + 80, 0.31)
    end
end

function spin3()
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX + 640, receptor.defaultY + 80, 0.31)
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX - 640, receptor.defaultY - 80, 0.31)
    end
end

function spin4()
    for i = 0, 3 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY + 80, 0.31)
    end
    for i = 4, 7 do 
        receptor = _G['receptor_'..i]
        receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY - 80, 0.31)
    end
end

function update(elapsed)
    if swayDefault then
        currentBeat = (songPos / 1000)*(bpm/180)
        for i = 0, 7, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 32 * math.sin((currentBeat + i*0))
        end
    end
    if swayDefaultABitFaster then
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 7, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 48 * math.sin((currentBeat + i*0))
        end
    end
    if swayCentreZardy then 
        currentBeat = (songPos / 1000)*(bpm/120)
        for i = 0, 3, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 32 * math.sin((currentBeat + i*0)) + 320
        end
    end
    if swayCentreBF then 
        currentBeat = (songPos / 1000)*(bpm/120)
        for i = 4, 7, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 32 * math.sin((currentBeat + i*0)) - 320
        end
    end
    if swayZardyDefault then
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 32 * math.sin((currentBeat + i*0))
        end
    end

    if swayCableIntenseDefault then 
        if spinLength < 48 then
            spinLength = spinLength + 0.03
        end

        currentBeat = (songPos / 1000)*(bpm/60)
        for i= 0, 7, 1 do
            receptor = _G['receptor_'..i]
	        receptor.x = receptor.defaultX + spinLength * math.sin((currentBeat + 2*0.25) * math.pi)
	        receptor.y = receptor.defaultY + spinLength * math.cos((currentBeat + 2*0.25) * math.pi)
        end
    end

    if swayCableSemiMiddle then 
        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - 160 * math.sin((currentBeat + i*0)) + 160
            receptor.y = receptor.defaultY - 32 * math.cos((currentBeat + i*2) * math.pi)
        end
        for i = 4, 7, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + 160 * math.sin((currentBeat + i*0)) - 160
            receptor.y = receptor.defaultY - 32 * math.cos((currentBeat + i*2) * math.pi)
        end
    end
    if swayCableCentre320To55 then 
        if swayLength > 80 then
            swayLength = swayLength - 0.02
        end

        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + swayLength * math.sin((currentBeat + i*0)) + 320
            receptor.y = receptor.defaultY + 32 * math.cos((currentBeat + i*2) * math.pi)
        end
        for i = 4, 7, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - swayLength * math.sin((currentBeat + i*0)) - 320
            receptor.y = receptor.defaultY - 32 * math.cos((currentBeat + i*2) * math.pi)
        end
    end

    if swayCableCentre420To55 then 
        if swayLength2 > 80 then
            swayLength2 = swayLength2 - 0.065
        end

        currentBeat = (songPos / 1000)*(bpm/60)
        for i = 0, 3, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX + swayLength2 * math.sin((currentBeat + i*0)) + 320
            receptor.y = receptor.defaultY + 32 * math.cos((currentBeat + i*2) * math.pi)
        end
        for i = 4, 7, 1 do
            receptor = _G['receptor_'..i]
            receptor.x = receptor.defaultX - swayLength2 * math.sin((currentBeat + i*0)) - 320
            receptor.y = receptor.defaultY - 32 * math.cos((currentBeat + i*2) * math.pi)
        end
    end

   if distractionZardy then 
        currentBeat = (songPos / 1000)*(bpm/60)
        if downscroll then 
            for i = 0, 3, 1 do
                receptor = _G['receptor_'..i]
                receptor.x = receptor.defaultX + 320 * math.sin((currentBeat + i*0)) + 320
                receptor.y = receptor.defaultY + 32 * math.cos((currentBeat + i*2) * math.pi) - 280
            end
        else
            for i = 0, 3, 1 do
                receptor = _G['receptor_'..i]
                receptor.x = receptor.defaultX + 320 * math.sin((currentBeat + i*0)) + 320
                receptor.y = receptor.defaultY + 32 * math.cos((currentBeat + i*2) * math.pi) + 280
            end
        end
    end
    if distraction1 then 
        currentBeat = (songPos / 250)*(bpm/60)
        if downscroll then 
            for i = 4, 7, 1 do 
                receptor = _G['receptor_'..i]
                receptor.x = receptor.defaultX + 32 * math.sin((currentBeat + i*2 + 2)) + 120
                receptor.y = receptor.defaultY + 48 * math.cos((currentBeat + i*2)) - 280
            end
        else
            for i = 4, 7, 1 do 
                receptor = _G['receptor_'..i]
                receptor.x = receptor.defaultX + 32 * math.sin((currentBeat + i*2 + 2)) + 120
                receptor.y = receptor.defaultY + 48 * math.cos((currentBeat + i*2)) + 280
            end
        end
    end
    if distraction2 then 
        currentBeat = (songPos / 250)*(bpm/60)
        if downscroll then 
            for i = 4, 7, 1 do 
                receptor = _G['receptor_'..i]
                receptor.x = receptor.defaultX + 32 * math.sin((currentBeat + i*3)) + 120
                receptor.y = receptor.defaultY + 48 * math.cos((currentBeat + i*4)) - 280
            end
        else 
            for i = 4, 7, 1 do 
                receptor = _G['receptor_'..i]
                receptor.x = receptor.defaultX + 32 * math.sin((currentBeat + i*3)) + 120
                receptor.y = receptor.defaultY + 48 * math.cos((currentBeat + i*4)) + 280
            end
        end
    end

    if arrowFadingSlow then 
        if curStep % 16 == 0 and not waitForStepFade then 
            waitForStepFade = true 
            arrowFaded = not arrowFaded 
            if arrowFaded then 
                for i = 0, 7 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 1, 1.24)
                end
            else 
                for i = 0, 7 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 0.3, 1.24)
                end
            end
        end
    end
    if arrowFadingFast then 
        if curStep % 4 == 0 and not waitForStepFade then 
            waitForStepFade = true 
            arrowFaded = not arrowFaded 
            if arrowFaded then 
                for i = 0, 3 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 1, 0.31)
                end
                for i = 4, 7 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 0.3, 0.31)
                end
            else 
                for i = 0, 3 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 0.3, 0.31)
                end
                for i = 4, 7 do 
                    receptor = _G['receptor_'..i]
                    receptor.tweenAlpha(receptor, 1, 0.31)
                end
            end
        end
    end

    if zardyFading then 
        if curStep % 16 and not waitForStepZardyFade then 
            waitForStepZardyFade = true 
            zardyFaded = not zardyFaded
            if zardyFaded then 
                dad.tweenAlpha(dad, 1, 1.24)
            else
                dad.tweenAlpha(dad, 0.3, 1.24)
            end
        end
    end

    if arrowBeatSpin then 
        if curStep % 4 == 0 and not waitForStepArrowSpin then 
            waitForStepArrowSpin = true 
            arrowSpun1 = not arrowSpun1 
            if arrowSpun1 then 
                arrowSpun2 = not arrowSpun2 
                if arrowSpun2 then 
                    spin4()
                else 
                    spin2()
                end
            else
                arrowSpun3 = not arrowSpun3 
                if arrowSpun3 then 
                    spin3()
                else 
                    spin1()
                end
            end
        end
    end
    if swayHud then 
        currentBeat = (songPos / 1000)*(bpm/60)
        camHudAngle = 4 * math.sin((currentBeat))
    else 
        camHudAngle = 0 
    end
end

function beatHit(beat)

end

function stepHit(step)
    waitForStepZardyFade = false 
    waitForStepFade = false 
    waitForStepArrowSpin = false 
    waitForCableCentreStep = false 
    waitForCableCentreStep2 = false 
-- Fading In of Arrows in the start 
    if step == 32 then 
        R1:tweenAlpha(1, 2.48)
        R6:tweenAlpha(1, 2.48)
    end
    if step == 64 then 
        R2:tweenAlpha(1, 2.48)
        R5:tweenAlpha(1, 2.48)
    end
    if step == 96 then 
        R3:tweenAlpha(1, 2.48)
        R4:tweenAlpha(1, 2.48)
    end
    if step == 128 then -- Start of Vocals
        swayDefault = true 
    end
-- THE FIRST VINE
    if step == 384 then 
        swayDefault = false 
        boyfriend.playAnim(boyfriend, 'hey')
        centreP1()
        primeDistraction()
    end
    if step == 388 then 
        swayCentreZardy = true 
        distraction1 = true 
    end
    if step == 496 then 
        swayCentreZardy = false 
        distraction1 = false 
        dieP1()
        centreP2() 
    end
    if step == 500 then 
        swayCentreBF = true
        distractionZardy = true 
    end
-- Calmed Down Again 
    if step == 640 then 
        distractionZardy = false 
        swayCentreBF = false 
        returnP1()
        returnP2()
    end
    if step == 644 then 
        swayDefault = true 
    end
-- Intense again 
    if step == 896 then 
        zardyFading = true 
        swayDefault = false 
        swayDefaultABitFaster = true 
    end
-- Second Vine 
    if step == 1152 then 
        swayDefaultABitFaster = false 
        swayZardyDefault = true 
        primeDistraction()
        boyfriend.playAnim(boyfriend, 'hey')
    end
    if step == 1156 then 
        distraction2 = true 
    end
    if step == 1264 then 
        distraction2 = false 
        returnP2()
    end
    if step == 1268 then 
        swayDefaultABitFaster = true  
        swayZardyDefault = false  
    end
-- Slowed again
    if step == 1408 then 
        zardyFading = false 
        swayDefaultABitFaster = false 
        swayDefault = true 
        dad.tweenAlpha(dad, 0.7, 1.24)
    end
    if step == 1664 then 
        arrowFadingSlow = true 
    end
    if step == 1920 then 
        arrowFadingSlow = false  
        arrowFaded = false 
        swayDefault = false 
        returnP1()
        returnP2()
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 0, 0.31)
        end
    end
    if step == 1980 then 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.31)
        end
    end
-- CABLE CROW TIME!! 
    if step == 1984 then 
        swayCableIntenseDefault = true 
    end
    if step == 2236 then 
        swayCableIntenseDefault = false 
        primeSemiMiddle()
    end
    if step == 2236 then 
        swayCableSemiMiddle = true 
    end
    if step == 2494 then 
        swayCableSemiMiddle = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 1.24)
        end
    end
    if step == 2528 then 
        arrowBeatSpin = true 
    end
-- Back to slow part
    if step == 2784 then 
        arrowBeatSpin = false 
        returnP1()
        returnP2()
    end
    if step == 2788 then 
        swayDefaultABitFaster = true 
    end
    if step == 3040 then 
        swayDefaultABitFaster = false 
        swayDefault = true 
    end
-- Intense again 
    if step == 3296 then 
        swayDefault = false 
        swayCableCentre320To55 = true 
    end
    if step == 3552 then 
        swayHud = true 
    end
-- Slow Break 
    if step == 4320 then 
        swayCableCentre320To55 = false 
        swayHud = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 4.96)
        end
    end
    if step == 4384 then 
        swayHud = true 
        swayCableCentre420To55 = true 
        arrowFadingFast = true
    end
-- END! 
    if step == 4892 then 
        arrowFadingFast = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenAlpha(receptor, 1, 0.31)
        end
    end
    if step == 4896 then 
        swayCableCentre420To55 = false 
        swayHud = false 
        for i = 0, 7 do 
            receptor = _G['receptor_'..i]
            receptor.tweenPos(receptor, receptor.defaultX, receptor.defaultY, 2.48)
            receptor.tweenAlpha(receptor, 0, 2.48)
        end
    end
end