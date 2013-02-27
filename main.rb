#メイン文

#dxrubyの呼び出し
require 'dxruby'

#作成したクラス群の呼び出し
require_relative 'lib/scene'
require_relative 'lib/title'
require_relative 'lib/level'
require_relative 'lib/game'

#シーンのインスタンス化と命名
game   = Game.new
level = Level.new
title  = Title.new
Scene.add_scene(:title,  title)
Scene.add_scene(:level, level)
Scene.add_scene(:game,   game)

#最初のシーンをどれにするか
Scene.set_scene(:title)

#Sceneのインスタンスを切り替えながら表示
Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.play
end
