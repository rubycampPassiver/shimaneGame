# coding: Shift_JIS

#�s����\���N���X
class Citizen < Sprite
  
  #�N���X�ϐ��Q
  #  @@img = Image.load(File.expand_path("../../image/citizen.png", __FILE__))#�o�b�N�O���E���h�摜
  #  @@py = 456#�Œ�

  #  @@pos[0, 0, 0, 0]

  #�C���X�^���X�ϐ��Q
  @travering = false
  @isItemTrue = false # �v�������A�C�e�������������B�@�i�������Ȃ�������ׂ̌��ɂ����Ă��܂��H�H
  @px = 100
  @witch = false # false => leftWindow : true = > RightWindow

  #�f�t�H���g�R���X�g���N�^
	def initialize(x, witch) 
		self.image = Image.load(File.expand_path("../../image/citizen.png", __FILE__))#�{�̂̉摜
		@travering = false
		@isItemTrue = false
		@px = x
		@py = 456
		@witch = witch # left
		self.x = @px
		self.y = @py
    
    @requirement = getitemrandom
    #self.draw(@px,@@py,@@img.setColorKey([255,255,255]))#citizen�̉摜��ǂ�œ��ߏ����{�w��ƍ���
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
		if @witch == true # true�Ȃ�A���݈ʒu�����̃E�B���h�E
			self.x += 5 # �E�̃E�B���h�E�ֈړ�����.-----------------------5�̓X�s�[�h�̂��ƁB
		else self.x -= 5 # ���̃E�B���h�E�Ɉړ�����.
		end
	end

  #�Փ˔���
	def hit(obj)
    if obj.is_a?(Item) then #�A�C�e���Ƃ̏Փ˂̏ꍇ
      
    end
	end

	def vanished?
		return @vanished
	end
  
  #�v���A�C�e���������_���ɔ���������
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