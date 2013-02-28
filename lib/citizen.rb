# coding: Shift_JIS

#市民を表すクラス
class Citizen < Sprite
  
  #クラス変数群
  #  @@img = Image.load(File.expand_path("../../image/citizen.png", __FILE__))#バックグラウンド画像
  #  @@py = 456#固定

  #  @@pos[0, 0, 0, 0]

  #インスタンス変数群
  @travering = false
  @isItemTrue = false # 要求したアイテムが正しいか。　（正しくなかったら隣の県にいってしまう？？
  @px = 100
  @witch = false # false => leftWindow : true = > RightWindow

  #デフォルトコンストラクタ
	def initialize(x, witch) 
		self.image = Image.load(File.expand_path("../../image/citizen.png", __FILE__))#本体の画像
		@travering = false
		@isItemTrue = false
		@px = x
		@py = 456
		@witch = witch # left
		self.x = @px
		self.y = @py
    
    @requirement = getitemrandom
    #self.draw(@px,@@py,@@img.setColorKey([255,255,255]))#citizenの画像を読んで透過処理＋背後と合成
    # @x_speed = 1#@@default_y_speed 
    # @x_direction = 1#@@default_x_speed
	end

	def update
		self.draw
		if @isItemTrue
      #        if true
			move
		end
		@vanished = true if self.y >= Window.height - 325
	end

	def move
		if @witch == true # trueなら、現在位置が左のウィンドウ
			self.x += 5 # 右のウィンドウへ移動する.-----------------------5はスピードのこと。
		else self.x -= 5 # 左のウィンドウに移動する.
		end
	end

  #衝突判定
	def hit(obj)
    if obj.is_a?(Item) then #アイテムとの衝突の場合
      
    end
	end

	def vanished?
		return @vanished
	end
  
  #要求アイテムをランダムに発生させる
  def getitemrandom
    posarr = []
    sum = 0.0
    flag = rand(100.0)
    posarr.each do |item|
      sum += item
      if flag < sum then
        
      end
    end
  end
end