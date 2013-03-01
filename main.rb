#メイン文

#dxrubyの呼び出し
require 'dxruby'

#ウィンドウサイズの設定
Window.width = 800
Window.height = 600

#作成したクラス群の呼び出し
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

#シーンのインスタンス化と命名
Scene.add_scene(:title, Title.new)
Scene.add_scene(:level, Level.new)
Scene.add_scene(:chugoku, Game.new(Game::CHUGOKU))
Scene.add_scene(:westjp, Game.new(Game::WESTJP))
Scene.add_scene(:alljp, Game.new(Game::ALLJP))

#最初のシーンをどれにするか
Scene.set_scene(:title)

#Sceneのインスタンスを切り替えながら表示
Window.loop do
  break if (Input.keyPush?(K_ESCAPE) || Scene.get_finish)
  Scene.play#シーンのplayメソッド呼び出し
end
