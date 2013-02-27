#���C����

#dxruby�̌Ăяo��
require 'dxruby'


Window.width = 800
Window.height = 600

#dxruby�̌Ăяo��
require 'dxruby'

#�쐬�����N���X�Q�̌Ăяo��
require_relative 'lib/scene'
require_relative 'lib/title'
require_relative 'lib/level'
require_relative 'lib/item'
require_relative 'lib/game'
require_relative 'lib/game_miyagi'
require_relative 'lib/game_osaka'
require_relative 'lib/game_tokyo'
require_relative 'lib/game_tottori'

#�V�[���̃C���X�^���X���Ɩ���
level = Level.new
title  = Title.new
miyagi = Game_miyagi.new
osaka = Game_osaka.new
tokyo = Game_tokyo.new
tottori   = Game_tottori.new

#�V�[���̃C���X�^���X���Ɩ���
Scene.add_scene(:title,  title)
Scene.add_scene(:level, level)
Scene.add_scene(:miyagi, miyagi)
Scene.add_scene(:osaka, osaka)
Scene.add_scene(:tokyo,  tokyo)
Scene.add_scene(:tottori, tottori)

#�ŏ��̃V�[�����ǂ�ɂ��邩
Scene.set_scene(:title)

#Scene�̃C���X�^���X��؂�ւ��Ȃ���\��
Window.loop do
  break if (Input.keyPush?(K_ESCAPE) || Scene.get_finish)
  Scene.play#�V�[����play���\�b�h�Ăяo��
end
