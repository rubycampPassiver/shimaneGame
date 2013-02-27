#coding: SJIS

class Level
  attr_accessor :pref 
  attr_accessor :dist 
  attr_accessor :alljp
  attr_reader :cursorbit
  
  def initialize
    
    downpx = 150
    Image.load(File.expand_path("../../image/title.png", __FILE__))#背景画像
    @level_title = "対戦レベル"#タイトル文
    prefimg = Image.load(File.expand_path("../../image/pref_tottori.png", __FILE__))
    Sprite.new((Window.width-prefimg.width)/2-200,Window.height/2+downpx,prefimg)#県のイメージ
    distimg = Image.load(File.expand_path("../../image/dist_chugoku.png", __FILE__))
    Sprite.new((Window.width-distimg.width)/2,Window.height/2+downpx,distimg)#地方のイメージ
    jpimg = Image.load(File.expand_path("../../image/all_japan.png", __FILE__))
    Sprite.new((Window.width-jpimg.width)/2+200,Window.height/2+downpx,jpimg)#全国のイメージ
    Sprite.new(0,0,Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))#擬似クリックのための小さなビットマップ
  end
  
  def play
    #次の画面への遷移
    Scene.set_scene(:game_tottori) if Input.keyPush?(K_SPACE)
    
    Window.draw(0,0,@bg_img)
    @smbit.x = Input.mousePosX  # マウスカーソルのx座標
    @smbit.y = Input.mousePosY  # マウスカーソルのy座標#
    
    Sprite.draw(@smbit)#
    Sprite.draw(@pref)#
    Sprite.draw(@dist)#
    Sprite.draw(@alljp)#
    puts "hit pref!" if Sprite.check(@smbit,@pref) unless  @smbit.check([@pref]).empty?
    puts "hit dist!" if Sprite.check(@smbit,@dist) unless @smbit.check([@dist]).empty?
    puts "hit jp!" if Sprite.check(@smbit,@alljp) unless @smbit.check([@alljp ]).empty?
    
  end
end
