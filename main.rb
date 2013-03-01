#���C����

#dxruby�̌Ăяo��
require 'dxruby'

#�E�B���h�E�T�C�Y�̐ݒ�
Window.width = 800
Window.height = 600

#�쐬�����N���X�Q�̌Ăяo��
require_relative 'lib/scene'
require_relative 'lib/title'
require_relative 'lib/level'
require_relative 'lib/game'
require_relative 'lib/bullet'
require_relative 'lib/item'
require_relative 'lib/crab'
require_relative 'lib/camel'
require_relative 'lib/orochi'
require_relative 'lib/pear'
require_relative 'lib/shijimi'
require_relative 'lib/money'
require_relative 'lib/citizen'
require_relative 'lib/enemy_mayor'
require_relative 'mayor'
require_relative 'enemy'

#�V�[���̃C���X�^���X���Ɩ���
Scene.add_scene(:title, Title.new)
Scene.add_scene(:level, Level.new)
Scene.add_scene(:chugoku, Game.new(Game::CHUGOKU))
Scene.add_scene(:westjp, Game.new(Game::WESTJP))
Scene.add_scene(:alljp, Game.new(Game::ALLJP))

#�ŏ��̃V�[�����ǂ�ɂ��邩
Scene.set_scene(:title)

#Scene�̃C���X�^���X��؂�ւ��Ȃ���\��
Window.loop do
  break if (Input.keyPush?(K_ESCAPE) || Scene.get_finish)
  Scene.play#�V�[����play���\�b�h�Ăяo��
end
