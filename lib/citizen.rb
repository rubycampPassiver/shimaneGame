# coding: Shift_JIS

#�s����\���N���X
class Citizen < Sprite
  
  #�C���X�^���X�ϐ��Q
  @travering = false
  @isItemTrue = false # �v�������A�C�e�������������B�@�i�������Ȃ�������ׂ̌��ɂ����Ă��܂��H�H
  @px = 100
  @witch = false # false => leftWindow : true = > RightWindow
  
  attr_accessor :requirement
  attr_accessor :isItemTrue
  
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
    
    @requirement = getitemrandom #�v���A�C�e���̐ݒ�
    
	end
  
	def update
    self.draw
    @requirement.update
		@requirement.draw
		move if @isItemTrue
		@vanished = true if self.y >= Window.height - 325
	end

	def move
		if @witch # true�Ȃ�A���݈ʒu�����̃E�B���h�E
			self.x += -5 # ���̃E�B���h�E�ֈړ�����.-----------------------5�̓X�s�[�h�̂��ƁB
		else self.x += 5 # �E�̃E�B���h�E�Ɉړ�����.
		end
	end

  #�Փ˔���
	def hit(obj)
    if obj.is_a?(Item) then #�A�C�e���Ƃ̏Փ˂̏ꍇ
      if requirement.is_a?(obj.class) then #�v���Ɠ����A�C�e���̏ꍇ
        @isItemTrue = true
        Item.add_friendpoint(obj.point)
      end
    end
	end

	def vanished?
		return @vanished
	end
  
  #�v���A�C�e���������_���ɔ���������
  def getitemrandom
    #�m���ɉ������A�C�e������
    posarr = [40,40,20]
    flag = rand(posarr.inject{|sum, n| sum + n })
    sum = 0.0
    count = 1
    
    posarr.each do |item|
      sum += item
      break if flag < sum
      count += 1
    end
    tmp = nil
    case count
    when 1 then tmp = Shijimi.new(self.x,self.y+100)
    when 2 then tmp = Money.new(self.x,self.y+100)
    else tmp = Orochi.new(self.x,self.y+100)
    end
    return tmp
  end
end