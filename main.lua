gfx = playdate.graphics
snd = playdate.sound

synth = snd.synth.new(snd.kWaveSawtooth)
synth:setADSR(0,0.1,0,0)

x=200
y=120
w=80
h=80
angle=0
king = gfx.image.new('images/king')
king:setInverted(true)

local font = gfx.font.new('font/namco-1x')
local bgColor = gfx.kColorBlack


function playdate.update()
	gfx.setColor(bgColor)
	gfx.fillRect(0, 0, 400, 240)
	
	gfx.setFont(font)
	gfx.drawText('testing... ', 4, 2)
	
	--local degrees = playdate.getCrankPosition()
	--w=(degrees / 3) + 1
	--h=(degrees / 3) + 1
	
	if playdate.buttonIsPressed(playdate.kButtonDown) then
		synth:playNote(200)
		y = y+5
		if y > 240 then
			y=-20
		end
	elseif playdate.buttonIsPressed(playdate.kButtonUp) then
		synth:playNote(150)
		y = y-5
		if y < 0 then
			y=260
		end
	end
	
	if playdate.buttonIsPressed(playdate.kButtonRight) then
		synth:playNote(300)
		x = x+5
		if x > 420 then
			x=-20
		end
	elseif playdate.buttonIsPressed(playdate.kButtonLeft) then
		synth:playNote(250)
		x = x-5
		if x < 0 then
			x=420
		end
	end
	
	--gfx.setColor(gfx.kColorWhite)
	king:drawRotated(x,y, angle)
end

function playdate.AButtonDown()
	if bgColor == gfx.kColorBlack then
		bgColor = gfx.kColorWhite
	else
		bgColor = gfx.kColorBlack
	end
end

function playdate.cranked(change, acelleragedChange)
  angle = angle + change
  --synth:playNote(100)

  if angle > 360 then
    angle = 0
  end
end