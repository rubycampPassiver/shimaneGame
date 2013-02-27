#���C����

#dxruby�̌Ăяo��
require 'dxruby'

#�쐬�����N���X�Q�̌Ăяo��
require_relative 'lib/scene'
require_relative 'lib/title'
require_relative 'lib/level'
require_relative 'lib/game'

#�V�[���̃C���X�^���X���Ɩ���
game   = Game.new
level = Level.new
title  = Title.new
Scene.add_scene(:title,  title)
Scene.add_scene(:level, level)
Scene.add_scene(:game,   game)

#�ŏ��̃V�[�����ǂ�ɂ��邩
Scene.set_scene(:title)

#Scene�̃C���X�^���X��؂�ւ��Ȃ���\��
Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.play
end
