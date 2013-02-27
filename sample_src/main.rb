?¿require 'dxruby'

require_relative 'lib/scene'
require_relative 'lib/title'
require_relative 'lib/game'
require_relative 'lib/ending'
require_relative 'lib/block'
require_relative 'lib/map'

game   = Game.new
title  = Title.new
ending = Ending.new

Scene.add_scene(:title,  title)
Scene.add_scene(:game,   game)
Scene.add_scene(:ending, ending)

Scene.set_scene(:title)


Window.loop do
  break if Input.keyPush?(K_ESCAPE) || ending.closed
  Scene.play
end
