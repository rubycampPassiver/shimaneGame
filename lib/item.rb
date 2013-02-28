# coding: Shift_JIS

#�A�C�e����\���N���X
class Item < Sprite
  
  #�N���X�ϐ��Q
  @@point = 10#�f�t�H���g�̓��_
  @@default_y_speed = 1#�f�t�H���g�̗������x
  @@default_x_speed = 1#�f�t�H���g�̉����x
  @@balloon = Image.load(File.expand_path("../../image/ballon.png", __FILE__))#�o�b�N�O���E���h�摜
  
  #�����ł̓����͊�{�S�ēǂݎ���p
  #�p����ŉς��ďo�͂���
  attr_reader :point
  attr_reader :default_y_speed
  attr_reader :default_x_speed
  attr_reader :ballon
  
  
  
  #�C���X�^���X�ϐ��Q
	attr_accessor :point#�A�C�e���̓��_
	attr_accessor :x_speed#�c�������x
	attr_accessor :x_direction#���������x

  #�f�t�H���g�R���X�g���N�^
	def initialize(x, y, img = Image.load(File.expand_path("../../image/pear.png", __FILE__))) #�f�t�H���g�́w�Ȃ��x�̉摜
    img2 = Image.load(File.expand_path("../../image/ballon.png", __FILE__))#�o�b�N�O���E���h�摜(�A�C�e���̔w��ɊۂȂǂ�)
    img2.draw(50,50,img.setColorKey([255,255,255]))#�A�C�e���̉摜��ǂ�œ��ߏ����{�w��ƍ���
    @point = 0
		super(x,y,img2)#�����摜���g���ăX�[�p�[�R���X�g���N�^�Ăяo��
    @x_speed = 1#@@default_y_speed 
    @x_direction = 1#@@default_x_speed
    self.scale_x,self.scale_y = 0.1, 0.1#���T�C�Y
	end

	def update
		self.y += 0.2 #�S�̂����։�����
    
		if self.x <= Window.width/2 #�G���̃A�C�e��
      
			if self.x<= 0+15 or Window.width/2-15 <= self.x then#���O�ɔ�яo������
				if (self.y <= Window.height - 400)||(self.x >= 380-self.image.width)
					@x_speed = 0.0
					@x_direction *= -1.0
				end
				(self.x -= 1 if self.x >= 380-self.image.width) if self.y <= Window.height - 400 #�i�E�ɔ�яo�����獶�֖߂��j���ɂ͂ݏo������
				(self.x += 1 if self.x <= 15) #���֔�яo������E�֖߂�
        
			end
		else #�������̃A�C�e��
			if self.x<= Window.width/2+15 or Window.width-15 <= self.x then#���O�ɔ�яo������
				if (self.y <= Window.height - 400)||(self.x <= Window.width - 360)#���ɗ��߂�����
					@x_speed = 0.0
					@x_direction *= -1.0
				end
				self.x -= 1 if self.x >= Window.width - self.image.width #�E�֔�яo�����獶�֖߂�
				(self.x += 1 if self.x <= Window.width/2 + 15) if self.y <= Window.height - 400 #�i���ɔ�яo������E�֖߂��j���ւ͂ݏo������
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