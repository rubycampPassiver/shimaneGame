#coding: shift_jis

require 'dxruby'

Window.width  = 800
Window.height = 600

image = Image.load("images/game.png")
font  = Font.new(40)

count_timer = 180
i = 0
min = 0
sec = 0


Window.loop do

Window.draw(0,0,image)

min = count_timer / 60
sec = count_timer % 60
i += 1
	if i == 59 then 
		i = 0
		count_timer -= 1
		if count_timer < 0 then
			break #ここはbreakでなく０秒になったときの処理を書く
		end
	end
	if sec <= 9 then　　#秒数が1～9秒のときの表記が 2:9といったようになるので2:09となるようにした
		Window.drawFont(365, 220, "#{min}:0#{sec}", font, :color => [0, 0, 0])
	else　　　　　      #それ以外の時は普通に表示
		Window.drawFont(365, 220, "#{min}:#{sec}", font, :color => [0, 0, 0])
	end
end
