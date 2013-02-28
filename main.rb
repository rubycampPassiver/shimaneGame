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
require_relative 'lib/item'
require_relative 'lib/game'
#require_relative 'lib/game_miyagi'
#require_relative 'lib/game_osaka'
#require_relative 'lib/game_tokyo'
#require_relative 'lib/game_tottori'
require_relative 'lib/bullet'

#�V�[���̃C���X�^���X���Ɩ���
Scene.add_scene(:title,  Title.new)
Scene.add_scene(:level, Level.new)
Scene.add_scene(:chugoku, Game.new(Game::CHUGOKU))
Scene.add_scene(:westjp, Game.new(Game::WESTJP))
Scene.add_scene(:alljp, Game.new(Game::ALLJP))
#Scene.add_scene(:miyagi, Game_miyagi.new)
#Scene.add_scene(:osaka, Game_osaka.new)
#Scene.add_scene(:tokyo,  Game_tokyo.new)
#Scene.add_scene(:tottori, Game_tottori.new)

#�ŏ��̃V�[�����ǂ�ɂ��邩
Scene.set_scene(:title)

#Scene�̃C���X�^���X��؂�ւ��Ȃ���\��
Window.loop do
  break if (Input.keyPush?(K_ESCAPE) || Scene.get_finish)
  Scene.play#�V�[����play���\�b�h�Ăяo��
end
