# coding: Shift_JIS

#アイテムを表すクラス
class Item < Sprite
  
  #クラス変数群
  @@point = 10#デフォルトの得点
  @@default_y_speed = 1#デフォルトの落下速度
  @@default_x_speed = 1#デフォルトの横速度
  @@balloon = Image.load(File.expand_path("../../image/ballon.png", __FILE__))#バックグラウンド画像
  
  #ここでの特性は基本全て読み取り専用
  #継承先で可変して出力する
  attr_reader :point
  attr_reader :default_y_speed
  attr_reader :default_x_speed
  attr_reader :ballon
  
  
  
  #インスタンス変数群
	attr_accessor :point#アイテムの得点
	attr_accessor :x_speed#縦方向速度
	attr_accessor :x_direction#横方向速度

  #デフォルトコンストラクタ
	def initialize(x, y, img = Image.load(File.expand_path("../../image/pear.png", __FILE__))) #デフォルトは『なし』の画像
    img2 = Image.load(File.expand_path("../../image/ballon.png", __FILE__))#バックグラウンド画像(アイテムの背後に丸などを)
    img2.draw(50,50,img.setColorKey([255,255,255]))#アイテムの画像を読んで透過処理＋背後と合成
    @point = 0
		super(x,y,img2)#合成画像を使ってスーパーコンストラクタ呼び出し
    @x_speed = 1#@@default_y_speed 
    @x_direction = 1#@@default_x_speed
    self.scale_x,self.scale_y = 0.1, 0.1#リサイズ
	end

	def update
		self.y += 0.2 #全体を下へ下げる
    
		if self.x <= Window.width/2 #敵側のアイテム
      
			if self.x<= 0+15 or Window.width/2-15 <= self.x then#横外に飛び出したら
				if (self.y <= Window.height - 400)||(self.x >= 380-self.image.width)
					@x_speed = 0.0
					@x_direction *= -1.0
				end
				(self.x -= 1 if self.x >= 380-self.image.width) if self.y <= Window.height - 400 #（右に飛び出したら左へ戻す）下にはみ出したら
				(self.x += 1 if self.x <= 15) #左へ飛び出したら右へ戻す
        
			end
		else #味方側のアイテム
			if self.x<= Window.width/2+15 or Window.width-15 <= self.x then#横外に飛び出したら
				if (self.y <= Window.height - 400)||(self.x <= Window.width - 360)#下に来過ぎたら
					@x_speed = 0.0
					@x_direction *= -1.0
				end
				self.x -= 1 if self.x >= Window.width - self.image.width #右へ飛び出したら左へ戻す
				(self.x += 1 if self.x <= Window.width/2 + 15) if self.y <= Window.height - 400 #（左に飛び出したら右へ戻す）下へはみ出したら
			end
		end

		@x_speed += 0.04
		self.x += (@x_speed*@x_direction)
		@vanished = true if self.y >= Window.height - 325
	end

	def vanished?
		return @vanished
	end

end