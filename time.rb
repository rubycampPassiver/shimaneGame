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
			break #������break�łȂ��O�b�ɂȂ����Ƃ��̏���������
		end
	end
	if sec <= 9 then�@�@#�b����1�`9�b�̂Ƃ��̕\�L�� 2:9�Ƃ������悤�ɂȂ�̂�2:09�ƂȂ�悤�ɂ���
		Window.drawFont(365, 220, "#{min}:0#{sec}", font, :color => [0, 0, 0])
	else�@�@�@�@�@      #����ȊO�̎��͕��ʂɕ\��
		Window.drawFont(365, 220, "#{min}:#{sec}", font, :color => [0, 0, 0])
	end
end
