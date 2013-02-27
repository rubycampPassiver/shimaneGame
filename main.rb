#メイン文

#dxrubyの呼び出し
require 'dxruby'


Window.width = 800
Window.height = 600

#dxrubyの呼び出し
require 'dxruby'

#作成したクラス群の呼び出し
require_relative 'lib/scene'
require_relative 'lib/title'
require_relative 'lib/level'
require_relative 'lib/item'
require_relative 'lib/game'
require_relative 'lib/game_miyagi'
require_relative 'lib/game_osaka'
require_relative 'lib/game_tokyo'
require_relative 'lib/game_tottori'

#シーンのインスタンス化と命名
level = Level.new
title  = Title.new
miyagi = Game_miyagi.new
osaka = Game_osaka.new
tokyo = Game_tokyo.new
tottori   = Game_tottori.new

#シーンのインスタンス化と命名
Scene.add_scene(:title,  title)
Scene.add_scene(:level, level)
Scene.add_scene(:miyagi, miyagi)
Scene.add_scene(:osaka, osaka)
Scene.add_scene(:tokyo,  tokyo)
Scene.add_scene(:tottori, tottori)

#最初のシーンをどれにするか
Scene.set_scene(:title)

#Sceneのインスタンスを切り替えながら表示
Window.loop do
  break if (Input.keyPush?(K_ESCAPE) || Scene.get_finish)
  Scene.play#シーンのplayメソッド呼び出し
end
