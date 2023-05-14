function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    music = love.audio.newSource("music/swoon.wav", "stream")
    music:setLooping(true)
    music:setVolume(0.8)
    music:play()
    sadsong = love.audio.newSource("music/sadsong.wav", "stream")
    sadsong:setLooping(true)
    sadsong:setVolume(0.8)
    trophy = love.audio.newSource("music/trophy.wav", "static")
    trophy:setLooping(true)
    trophy:setVolume(0.8)
    trophy:seek(12.25)

    Timer = require "lib.Timer"

    kissing = false

    toadScream = love.audio.newSource("sounds/000000d1.wav", "static")
    warioScream = love.audio.newSource("sounds/000000cf.wav", "static")
    waluigiScream = love.audio.newSource("sounds/000000d0.wav", "static")

    sadBG = love.graphics.newImage("images/sad.png")
    loseText = love.graphics.newImage("images/deathtext.png")
    loseTextY = {800}
    gameOverSpr = love.graphics.newImage("images/gameover.png")
    rightclicktoskip = love.graphics.newImage("images/rightclicktoskip.png")

    waluigiTitle = {
        [0] = love.graphics.newImage("sprites/waluigiTitle/sprite20_0.png"),
        [1] = love.graphics.newImage("sprites/waluigiTitle/sprite20_1.png")
    }
    warioTitle = {
        [0] = love.graphics.newImage("sprites/warioTitle/sprite21_0.png"),
        [1] = love.graphics.newImage("sprites/warioTitle/sprite21_1.png")
    }
    heartLeft = {
        [0] = love.graphics.newImage("sprites/heartLeft/sprite22_0.png"),
        [1] = love.graphics.newImage("sprites/heartLeft/sprite22_1.png")
    }
    heartRight = {
        [0] = love.graphics.newImage("sprites/heartRight/sprite23_0.png"),
        [1] = love.graphics.newImage("sprites/heartRight/sprite23_1.png")
    }
    playButton = {
        [0] = love.graphics.newImage("sprites/play/sprite24_0.png"),
        [1] = love.graphics.newImage("sprites/play/sprite24_1.png")
    }
    switchScreenModesButton = {
        [0] = love.graphics.newImage("sprites/switchScreenModes/sprite37_0.png"),
        [1] = love.graphics.newImage("sprites/switchScreenModes/sprite37_1.png")
    }
    creditsButton = {
        [0] = love.graphics.newImage("sprites/credits/sprite24_0.png"),
        [1] = love.graphics.newImage("sprites/credits/sprite24_1.png")
    }
    howtoplayButton = {
        [0] = love.graphics.newImage("sprites/howtoplay/sprite24_0.png"),
        [1] = love.graphics.newImage("sprites/howtoplay/sprite24_1.png")
    }
    -- there are 49 playOUT sprites, playOUT's name is sprite34_x.png
    playOUT = {
        [0] = love.graphics.newImage("sprites/playOUT/sprite34_0.png"),
        [1] = love.graphics.newImage("sprites/playOUT/sprite34_1.png"),
        [2] = love.graphics.newImage("sprites/playOUT/sprite34_2.png"),
        [3] = love.graphics.newImage("sprites/playOUT/sprite34_3.png"),
        [4] = love.graphics.newImage("sprites/playOUT/sprite34_4.png"),
        [5] = love.graphics.newImage("sprites/playOUT/sprite34_5.png"),
        [6] = love.graphics.newImage("sprites/playOUT/sprite34_6.png"),
        [7] = love.graphics.newImage("sprites/playOUT/sprite34_7.png"),
        [8] = love.graphics.newImage("sprites/playOUT/sprite34_8.png"),
        [9] = love.graphics.newImage("sprites/playOUT/sprite34_9.png"),
        [10] = love.graphics.newImage("sprites/playOUT/sprite34_10.png"),
        [11] = love.graphics.newImage("sprites/playOUT/sprite34_11.png"),
        [12] = love.graphics.newImage("sprites/playOUT/sprite34_12.png"),
        [13] = love.graphics.newImage("sprites/playOUT/sprite34_13.png"),
        [14] = love.graphics.newImage("sprites/playOUT/sprite34_14.png"),
        [15] = love.graphics.newImage("sprites/playOUT/sprite34_15.png"),
        [16] = love.graphics.newImage("sprites/playOUT/sprite34_16.png"),
        [17] = love.graphics.newImage("sprites/playOUT/sprite34_17.png"),
        [18] = love.graphics.newImage("sprites/playOUT/sprite34_18.png"),
        [19] = love.graphics.newImage("sprites/playOUT/sprite34_19.png"),
        [20] = love.graphics.newImage("sprites/playOUT/sprite34_20.png"),
        [21] = love.graphics.newImage("sprites/playOUT/sprite34_21.png"),
        [22] = love.graphics.newImage("sprites/playOUT/sprite34_22.png"),
        [23] = love.graphics.newImage("sprites/playOUT/sprite34_23.png"),
        [24] = love.graphics.newImage("sprites/playOUT/sprite34_24.png"),
        [25] = love.graphics.newImage("sprites/playOUT/sprite34_25.png"),
        [26] = love.graphics.newImage("sprites/playOUT/sprite34_26.png"),
        [27] = love.graphics.newImage("sprites/playOUT/sprite34_27.png"),
        [28] = love.graphics.newImage("sprites/playOUT/sprite34_28.png"),
        [29] = love.graphics.newImage("sprites/playOUT/sprite34_29.png"),
        [30] = love.graphics.newImage("sprites/playOUT/sprite34_30.png"),
        [31] = love.graphics.newImage("sprites/playOUT/sprite34_31.png"),
        [32] = love.graphics.newImage("sprites/playOUT/sprite34_32.png"),
        [33] = love.graphics.newImage("sprites/playOUT/sprite34_33.png"),
        [34] = love.graphics.newImage("sprites/playOUT/sprite34_34.png"),
        [35] = love.graphics.newImage("sprites/playOUT/sprite34_35.png"),
        [36] = love.graphics.newImage("sprites/playOUT/sprite34_36.png"),
        [37] = love.graphics.newImage("sprites/playOUT/sprite34_37.png"),
        [38] = love.graphics.newImage("sprites/playOUT/sprite34_38.png"),
        [39] = love.graphics.newImage("sprites/playOUT/sprite34_39.png"),
        [40] = love.graphics.newImage("sprites/playOUT/sprite34_40.png"),
        [41] = love.graphics.newImage("sprites/playOUT/sprite34_41.png"),
        [42] = love.graphics.newImage("sprites/playOUT/sprite34_42.png"),
        [43] = love.graphics.newImage("sprites/playOUT/sprite34_43.png"),
        [44] = love.graphics.newImage("sprites/playOUT/sprite34_44.png"),
        [45] = love.graphics.newImage("sprites/playOUT/sprite34_45.png"),
        [46] = love.graphics.newImage("sprites/playOUT/sprite34_46.png"),
        [47] = love.graphics.newImage("sprites/playOUT/sprite34_47.png"),
        [48] = love.graphics.newImage("sprites/playOUT/sprite34_48.png")
    }
    creditsOUT = {
        [0] = love.graphics.newImage("sprites/creditsOUT/sprite43_0.png"),
        [1] = love.graphics.newImage("sprites/creditsOUT/sprite43_1.png"),
        [2] = love.graphics.newImage("sprites/creditsOUT/sprite43_2.png"),
        [3] = love.graphics.newImage("sprites/creditsOUT/sprite43_3.png"),
        [4] = love.graphics.newImage("sprites/creditsOUT/sprite43_4.png"),
        [5] = love.graphics.newImage("sprites/creditsOUT/sprite43_5.png"),
        [6] = love.graphics.newImage("sprites/creditsOUT/sprite43_6.png"),
        [7] = love.graphics.newImage("sprites/creditsOUT/sprite43_7.png"),
        [8] = love.graphics.newImage("sprites/creditsOUT/sprite43_8.png"),
        [9] = love.graphics.newImage("sprites/creditsOUT/sprite43_9.png"),
        [10] = love.graphics.newImage("sprites/creditsOUT/sprite43_10.png"),
        [11] = love.graphics.newImage("sprites/creditsOUT/sprite43_11.png"),
        [12] = love.graphics.newImage("sprites/creditsOUT/sprite43_12.png"),
        [13] = love.graphics.newImage("sprites/creditsOUT/sprite43_13.png"),
        [14] = love.graphics.newImage("sprites/creditsOUT/sprite43_14.png"),
        [15] = love.graphics.newImage("sprites/creditsOUT/sprite43_15.png"),
        [16] = love.graphics.newImage("sprites/creditsOUT/sprite43_16.png"),
        [17] = love.graphics.newImage("sprites/creditsOUT/sprite43_17.png"),
        [18] = love.graphics.newImage("sprites/creditsOUT/sprite43_18.png"),
        [19] = love.graphics.newImage("sprites/creditsOUT/sprite43_19.png"),
        [20] = love.graphics.newImage("sprites/creditsOUT/sprite43_20.png"),
        [21] = love.graphics.newImage("sprites/creditsOUT/sprite43_21.png"),
        [22] = love.graphics.newImage("sprites/creditsOUT/sprite43_22.png"),
        [23] = love.graphics.newImage("sprites/creditsOUT/sprite43_23.png"),
        [24] = love.graphics.newImage("sprites/creditsOUT/sprite43_24.png"),
        [25] = love.graphics.newImage("sprites/creditsOUT/sprite43_25.png"),
        [26] = love.graphics.newImage("sprites/creditsOUT/sprite43_26.png"),
        [27] = love.graphics.newImage("sprites/creditsOUT/sprite43_27.png"),
        [28] = love.graphics.newImage("sprites/creditsOUT/sprite43_28.png"),
        [29] = love.graphics.newImage("sprites/creditsOUT/sprite43_29.png"),
        [30] = love.graphics.newImage("sprites/creditsOUT/sprite43_30.png"),
        [31] = love.graphics.newImage("sprites/creditsOUT/sprite43_31.png"),
        [32] = love.graphics.newImage("sprites/creditsOUT/sprite43_32.png"),
        [33] = love.graphics.newImage("sprites/creditsOUT/sprite43_33.png"),
        [34] = love.graphics.newImage("sprites/creditsOUT/sprite43_34.png"),
        [35] = love.graphics.newImage("sprites/creditsOUT/sprite43_35.png"),
        [36] = love.graphics.newImage("sprites/creditsOUT/sprite43_36.png"),
        [37] = love.graphics.newImage("sprites/creditsOUT/sprite43_37.png"),
        [38] = love.graphics.newImage("sprites/creditsOUT/sprite43_38.png"),
        [39] = love.graphics.newImage("sprites/creditsOUT/sprite43_39.png"),
        [40] = love.graphics.newImage("sprites/creditsOUT/sprite43_40.png"),
        [41] = love.graphics.newImage("sprites/creditsOUT/sprite43_41.png"),
        [42] = love.graphics.newImage("sprites/creditsOUT/sprite43_42.png"),
        [43] = love.graphics.newImage("sprites/creditsOUT/sprite43_43.png"),
        [44] = love.graphics.newImage("sprites/creditsOUT/sprite43_44.png"),
        [45] = love.graphics.newImage("sprites/creditsOUT/sprite43_45.png"),
        [46] = love.graphics.newImage("sprites/creditsOUT/sprite43_46.png"),
        [47] = love.graphics.newImage("sprites/creditsOUT/sprite43_47.png"),
        [48] = love.graphics.newImage("sprites/creditsOUT/sprite43_48.png")
    }
    howtoplayOUT = {
        [0] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_0.png"),
        [1] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_1.png"),
        [2] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_2.png"),
        [3] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_3.png"),
        [4] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_4.png"),
        [5] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_5.png"),
        [6] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_6.png"),
        [7] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_7.png"),
        [8] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_8.png"),
        [9] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_9.png"),
        [10] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_10.png"),
        [11] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_11.png"),
        [12] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_12.png"),
        [13] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_13.png"),
        [14] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_14.png"),
        [15] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_15.png"),
        [16] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_16.png"),
        [17] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_17.png"),
        [18] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_18.png"),
        [19] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_19.png"),
        [20] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_20.png"),
        [21] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_21.png"),
        [22] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_22.png"),
        [23] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_23.png"),
        [24] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_24.png"),
        [25] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_25.png"),
        [26] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_26.png"),
        [27] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_27.png"),
        [28] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_28.png"),
        [29] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_29.png"),
        [30] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_30.png"),
        [31] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_31.png"),
        [32] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_32.png"),
        [33] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_33.png"),
        [34] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_34.png"),
        [35] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_35.png"),
        [36] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_36.png"),
        [37] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_37.png"),
        [38] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_38.png"),
        [39] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_39.png"),
        [40] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_40.png"),
        [41] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_41.png"),
        [42] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_42.png"),
        [43] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_43.png"),
        [44] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_44.png"),
        [45] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_45.png"),
        [46] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_46.png"),
        [47] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_47.png"),
        [48] = love.graphics.newImage("sprites/howtoplayOUT/sprite44_48.png"),
    }
    title = love.graphics.newImage("images/TITLE.png")
    cancel = love.graphics.newImage("images/cancel.png")
    titleBG = love.graphics.newImage("images/titlebg.png")
    
    -- play images
    SHOCKEDASSHIT = love.graphics.newImage("images/SHOCKEDASSHIT.png")
    Hooray = love.graphics.newImage("images/Hooray.png")
    bush = love.graphics.newImage("images/bush.png")
    block = love.graphics.newImage("images/block.png")
    qblock = love.graphics.newImage("sprites/qblock/qblock_0.png")
    sky = love.graphics.newImage("images/sky.png")
    cloud = love.graphics.newImage("images/cloud.png")
    bush = love.graphics.newImage("images/bush.png")
    blushers = {
        [0] = love.graphics.newImage("sprites/sexies/sprite18_0.png"),
        [1] = love.graphics.newImage("sprites/sexies/sprite18_1.png"),
    }
    kissers = {
        [0] = love.graphics.newImage("sprites/HOT/sprite19_0.png"),
        [1] = love.graphics.newImage("sprites/HOT/sprite19_1.png")
    }
    evilbitch = {
        [0] = love.graphics.newImage("sprites/TOAD/sprite25_0.png"),
        [1] = love.graphics.newImage("sprites/TOAD/sprite25_1.png"),
        x = 1200
    }
    evilbitchMad = {
        [0] = love.graphics.newImage("sprites/spr_Toad_Angry/spr_Toad_Angry_0.png"),
        [1] = love.graphics.newImage("sprites/spr_Toad_Angry/spr_Toad_Angry_1.png"),
        x=725
    }
    fruit = {
        [0] = love.graphics.newImage("sprites/fruit/sprite30_0.png"),
        [1] = love.graphics.newImage("sprites/fruit/sprite30_1.png"),
    }

    Hooray = love.graphics.newImage("images/Hooray.png")
    YIPPEE = love.graphics.newImage("images/YIPPEE.png")
    YIPPEEY = {-500}

    titlebgscroll = {x = 0, y = 0}
    twoCurrentFrame = 1
    fortyNineCurrentFrame = 1
    twoFrameTimer = 0
    twoFrameTimerMax = 0.7
    fortyNineFrameTimer = 0
    -- the fortyNineFramTimer is 24 frames per second
    fortyNineFrameTimerMax = 0.04166666666666666666666666666667

    love.window.setMode(850, 470, {resizable=false, vsync=false, minwidth=680, minheight=480})
    -- set background color to a bright magenta
    love.graphics.setBackgroundColor(0.85, 0, 0.85)

    animTimer = 0

    -- game shit
    percentage = 0

    curMenu = "title"

    toadComing = false
    toadChance = 0
    toadTimer = 0
end

function love.update(dt)
    Timer.update(dt)
    twoFrameTimer = twoFrameTimer + dt
    if twoFrameTimer > twoFrameTimerMax then
        twoCurrentFrame = (twoCurrentFrame + 1) % 2
        twoFrameTimer = 0
        -- do something
    end
    fortyNineFrameTimer = fortyNineFrameTimer + dt
    if fortyNineFrameTimer > fortyNineFrameTimerMax then
        fortyNineCurrentFrame = (fortyNineCurrentFrame + 1) % 49
        fortyNineFrameTimer = 0
        -- do something
    end

    if titlebgscroll.x > 824 then
        titlebgscroll.x = 0
    end
    titlebgscroll.x = titlebgscroll.x - 25 * dt
    if titlebgscroll.y > 808 then
        titlebgscroll.y = 0
    end
    titlebgscroll.y = titlebgscroll.y - 25 * dt

    if curMenu == "play" then 
        -- if mouse is down set kissing to true
        if love.mouse.isDown(1) then
            kissing = true
            percentage = percentage + 1 * dt
            if toadHere and not lose then 
                Timer.cancel(toadTween)
                lose = true
                love.audio.play(toadScream)
                Timer.after(0.5, function() 
                    SHOCKED = true
                    love.audio.play(waluigiScream) 
                    love.audio.stop(warioScream)
                    Timer.after(1, function()
                        music:stop()
                        sadsong:play()
                        Timer.tween(30, loseTextY, {-300}, "linear", function() drawGameOver = true end)
                        curMenu = "lose"
                        love.graphics.setBackgroundColor(0.2,0.2,0.2)
                    end)
                end)
            end
        elseif not love.mouse.isDown(1) and not lose then
            kissing = false
        end
    end

    if percentage > 100 then
        percentage = 100
        music:stop()
        trophy:play()

        curMenu = "win"
        Timer.tween(10, YIPPEEY, {0}, "linear", function() end)
    end

    if curMenu == "play" then
        toadChance = love.math.random(1, 1500)
        if toadChance == 1 and not toadComing then
            toadComing = true
            toadTween = Timer.tween(2, evilbitch, {x= 700}, "linear", function() Timer.after(1.5, function() Timer.tween(2, evilbitch, {x= 1200}, "linear", function() toadHere = false;toadComing=false end) end) end)
        end
    end

    if evilbitch.x <= 800 then
        toadHere = true
    else
        toadHere = false
    end
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        if x > 5 and x < 58 and y > 5 and y < 58 then
            love.event.quit()
        end

        if curMenu == "title" then
            if x > 230 and x < 323 and y > 320 and y < 400 then
                curMenu = "play"
                love.graphics.setBackgroundColor(87/255, 179/255, 239/255)
            end
        end
    elseif button == 2 then
        if curMenu == "lose" or curMenu == "win" then
            -- go to menu
            love.graphics.setBackgroundColor(0.85, 0, 0.85)
            curMenu = "title"
            trophy:stop()
            sadsong:stop()
            music:play()
            percentage = 0
            lose = false
            drawGameOver = false
            loseTextY = {-300}
            YIPPEEY = {-500}
            SHOCKED = false
            Timer.clear()
        end
    end
end

function love.draw()
    if curMenu == "title" then
        love.graphics.push()
            for i = 1, 3 do 
                for j = 1, 3 do
                    love.graphics.draw(titleBG, titlebgscroll.x + (i - 1) * 824, titlebgscroll.y + (j - 1) * 808)
                end
            end
        love.graphics.pop()
        love.graphics.draw(warioTitle[twoCurrentFrame], 805, 430, 0, 1, 1, warioTitle[twoCurrentFrame]:getWidth(), warioTitle[twoCurrentFrame]:getHeight())
        love.graphics.draw(waluigiTitle[twoCurrentFrame], 250, 225, 0, 1, 1, waluigiTitle[twoCurrentFrame]:getWidth(), waluigiTitle[twoCurrentFrame]:getHeight())
        love.graphics.draw(title, 675, 300, 0, 1, 1, title:getWidth(), title:getHeight())
        love.graphics.draw(cancel, 60, 60, 0, 1, 1, cancel:getWidth(), cancel:getHeight())
        love.graphics.draw(heartLeft[twoCurrentFrame], 110, 470, 0, 1, 1, heartLeft[twoCurrentFrame]:getWidth(), heartLeft[twoCurrentFrame]:getHeight())
        love.graphics.draw(heartRight[twoCurrentFrame], 800, 120, 0, 1, 1, heartRight[twoCurrentFrame]:getWidth(), heartRight[twoCurrentFrame]:getHeight())
        love.graphics.draw(playButton[twoCurrentFrame], 325, 400, 0, 1, 1, playButton[twoCurrentFrame]:getWidth(), playButton[twoCurrentFrame]:getHeight())
        --love.graphics.draw(playOUT[fortyNineCurrentFrame], 325, 400, 0, 1, 1, playOUT[fortyNineCurrentFrame]:getWidth(), playOUT[fortyNineCurrentFrame]:getHeight())
        love.graphics.draw(howtoplayButton[twoCurrentFrame], 550, 470, 0, 1, 1, playButton[twoCurrentFrame]:getWidth(), playButton[twoCurrentFrame]:getHeight())
        love.graphics.draw(creditsButton[twoCurrentFrame], 625, 400, 0, 1, 1, playButton[twoCurrentFrame]:getWidth(), playButton[twoCurrentFrame]:getHeight())
        love.graphics.draw(switchScreenModesButton[twoCurrentFrame], 400, 470, 0, 1, 1, playButton[twoCurrentFrame]:getWidth(), playButton[twoCurrentFrame]:getHeight())
    elseif curMenu == "play" then 
        love.graphics.draw(sky, 0, 0, 0, 1, 1)
        love.graphics.draw(cloud, 0, 0, 0, 1, 1)
        love.graphics.draw(block, 20, 45)
        love.graphics.draw(qblock, 20+96, 45)
        love.graphics.draw(block, 20+96*2, 45)
        love.graphics.draw(block, 20+96*3, 45)
        
        -- draw blushers
        if not SHOCKED then
            if not kissing then
                love.graphics.draw(blushers[twoCurrentFrame], 450, 500, 0, 1, 1, blushers[twoCurrentFrame]:getWidth(), blushers[twoCurrentFrame]:getHeight())
            else
                love.graphics.draw(kissers[twoCurrentFrame], 400, 500, 0, 1, 1, kissers[twoCurrentFrame]:getWidth(), kissers[twoCurrentFrame]:getHeight())
            end
        else
            love.graphics.draw(SHOCKEDASSHIT, 400, 500, 0, 1, 1, SHOCKEDASSHIT:getWidth(), SHOCKEDASSHIT:getHeight())
        end
        if not lose then
            love.graphics.draw(evilbitch[twoCurrentFrame], evilbitch.x, 450, 0, 1, 1, evilbitch[twoCurrentFrame]:getWidth(), evilbitch[twoCurrentFrame]:getHeight())
        else
            love.graphics.draw(evilbitchMad[twoCurrentFrame], evilbitch.x, 450, 0, 1, 1, evilbitchMad[twoCurrentFrame]:getWidth(), evilbitchMad[twoCurrentFrame]:getHeight())
        end
        love.graphics.draw(bush, 625, 220, 0, 0.8, 0.8)
        love.graphics.draw(fruit[twoCurrentFrame], 725, 325, 0, 0.9, 0.9)
        -- draw percentage bar at top left
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", 0, 0, 300, 30)
        love.graphics.setColor(0.85, 0, 0.85)
        -- percentage goes from 0-100
        love.graphics.rectangle("fill", 0, 0, percentage * 3, 30)
        love.graphics.setColor(1,1,1)
    elseif curMenu == "lose" then
        love.graphics.draw(sadBG)
        love.graphics.draw(loseText, 140, loseTextY[1])
        if drawGameOver then
            love.graphics.draw(gameOverSpr, 140, 90, 0, 0.9, 0.9)
        end
        love.graphics.draw(rightclicktoskip, 625, 455, 0)
    elseif curMenu == "win" then
        love.graphics.draw(sky, 0, 0, 0, 1, 1)
        love.graphics.draw(heartLeft[twoCurrentFrame], 270, 120, 0, 1, 1, heartLeft[twoCurrentFrame]:getWidth(), heartLeft[twoCurrentFrame]:getHeight())
        love.graphics.draw(heartRight[twoCurrentFrame], 700, 340, 0, 1, 1, heartRight[twoCurrentFrame]:getWidth(), heartRight[twoCurrentFrame]:getHeight())
        love.graphics.draw(Hooray, 140, 90, 0, 0.9, 0.9)
        love.graphics.draw(YIPPEE, 140, YIPPEEY[1])
        love.graphics.draw(rightclicktoskip, 625, 455, 0)
    end

    love.graphics.setColor(0,0,0)
    love.graphics.print("x: " .. love.mouse.getX(), 0, 0)
    love.graphics.print("y: " .. love.mouse.getY(), 0, 15)
    love.graphics.print("curMenu: " .. curMenu, 0, 30)
    love.graphics.print("twoCurrentFrame: " .. twoCurrentFrame, 0, 45)
    love.graphics.print("fortyNineCurrentFrame: " .. fortyNineCurrentFrame, 0, 60)
    love.graphics.print("Graphics Memory: " .. love.graphics.getStats().texturememory/1024/1024, 0, 75)
    love.graphics.setColor(1,1,1)
end