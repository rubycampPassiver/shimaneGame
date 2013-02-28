# coding: Shift_JIS

class Item < Sprite
	attr_accessor :speed
	attr_accessor :muki

	def initialize(*)
		super
		@speed = 1
		@muki = 1
	end


	def update
		self.y += 0.2
		if self.x <= 385
			if (self.x >= 380-self.image.width)||(self.x <= 15)
				if (self.y <= Window.height - 400)||(self.x >= 380-self.image.width)
					@speed = 0
					@muki *= -1
				end

				if self.x >= 380-self.image.width
					self.x -= 1
				end

				if self.y <= Window.height - 400
					if self.x <= 15
						self.x += 1
					end
				end
			end
		else
			if (self.x >= Window.width - self.image.width)||(self.x <= Window.width - 360)
				if (self.y <= Window.height - 400)||(self.x <= Window.width - 360)
					@speed = 0
					@muki *= -1
				end

				if self.x >= Window.width - self.image.width
					self.x -= 1
				end

				if self.x <= Window.width - 360
					self.x += 1
				end
			end
		end

		@speed += 0.04

		self.x += (@speed*@muki)
		
		if self.y >= Window.height - 325
      @vanished = true
    end
	end

	def vanished?
		return @vanished
	end



end