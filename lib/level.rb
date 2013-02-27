#coding: SJIS

class Level
  attr_accessor :pref 
  attr_accessor :dist 
  attr_accessor :alljp
  attr_reader :cursorbit
  
  def initialize
    
    downpx = 150
    @bg_img=Image.load(File.expand_path("../../image/title.png", __FILE__))#背景画像
    @level_title = "対戦レベル"#タイトル文
    prefimg = Image.load(File.expand_path("../../image/pref_tottori.png", __FILE__))
    @pref=Sprite.new((Window.width-prefimg.width)/2-200,Window.height/2+downpx,prefimg)#県のイメージ
    distimg = Image.load(File.expand_path("../../image/dist_chugoku.png", __FILE__))
    @dist=Sprite.new((Window.width-distimg.width)/2,Window.height/2+downpx,distimg)#地方のイメージ
    jpimg = Image.load(File.expand_path("../../image/all_japan.png", __FILE__))
    @alljp=Sprite.new((Window.width-jpimg.width)/2+200,Window.height/2+downpx,jpimg)#全国のイメージ
    @pt=Sprite.new(0,0,Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))#擬似クリックのための小さなビットマップ
  end
  
  def play
    
    Scene.set_scene(:Game_tottori) if Input.keyPush?(K_SPACE)#終了条件
    Window.draw(0,0,@bg_img)#バックグラウンドセット
    click = Input.mouseDown?(M_LBUTTON) ? true : false    
    
    #擬似オブジェクトのセット
    @pt.x = Input.mousePosX  # マウスカーソルのx座標
    @pt.y = Input.mousePosY  # マウスカーソルのy座標#
    
    #各スプライトの描画
    Sprite.draw(@pt)#
    Sprite.draw(@pref)#
    Sprite.draw(@dist)#
    Sprite.draw(@alljp)#
    
    #ボタン処理（次の画面への遷移）
    if click then 
      Scene.set_scene(:game_tottori) unless @pt.check([@pref]).empty?
      Scene.set_scene(:game_osaka) unless @pt.check([@dist]).empty?
      Scene.set_scene(:game_tokyo) unless @pt.check([@alljp ]).empty?
    end
    #    puts "hit pref!" if Sprite.check(@pt,@pref) unless  @smbit.check([@pref]).empty?
    #    puts "hit dist!" if Sprite.check(@pt,@dist) unless @smbit.check([@dist]).empty?
    #    puts "hit jp!" if Sprite.check(@pt,@alljp) unless @smbit.check([@alljp ]).empty?
    
  end
end
