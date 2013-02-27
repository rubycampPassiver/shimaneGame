class Title
  def initialize
		#左クリック時のみ座標を取得
#		if Input.mouseDown?(M_LBUTTON) then
#      x = Input.mousePosX
#      y = Input.mousePosY
#		end
    #オブジェクトの読み込み
    @bg =  Image.load(File.expand_path("../../image/title.png", __FILE__))#バックグラウンド画像
    @img_start = Sprite.new(275,150, Image.load(File.expand_path("../../image/start.png", __FILE__)))#ボタン（スタート）の表示
    @img_level = Sprite.new(275,300, Image.load(File.expand_path("../../image/level.png", __FILE__)))#ボタン（レベル選択）の表示
    @img_end = Sprite.new(275,450, Image.load(File.expand_path("../../image/end.png", __FILE__)))#ボタン（終了）の表示
    @pt = Sprite.new(0,0, Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))#擬似クリック用の小さなピクセルの表示
  end
  
  def update
    #擬似ポインタをクリック先に移動
    @pt.x = Input.mousePosX
    @pt.y = Input.mousePosY
  end
  
  def play
    
    #擬似ポインタの座標をアップデート
    self.update
    @pt.draw
    
    #オブジェクトの描画
    Window.draw(0, 0, @bg)#バックグラウンド
    @img_start.draw
    @img_level.draw
    @img_end.draw 
#   @pt.draw
#   Sprite.draw(@pt)#
    
    #マウスクリックイベント
    if Input.mouseDown?(M_LBUTTON) then
      puts "hit"
      #シーン遷移の条件
      Scene.set_scene(:tottori) unless @pt.check(@img_start).empty?
      Scene.set_scene(:level) unless @pt.check(@img_level).empty?
      Scene.finish unless @pt.check(@img_end).empty?
		end

    
	
  end

end
