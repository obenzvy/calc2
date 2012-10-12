class Card < ActiveRecord::Base
  attr_accessible :general_rate, :issuer_id, :name, :rewards_type, :threshold_amount, :threshold_rate

	belongs_to :issuer
	has_many :programs

	def annual_spend amount 
		amount * 12
	end

	def general_rewards amount
		if annual_spend(amount) <= self.threshold_amount
			annual_spend(amount) * self.threshold_rate
		else
				(self.threshold_amount * self.threshold_rate) + ((annual_spend(amount) - self.threshold_amount) * self.general_rate)
		end
	end

	def program_details
		self.programs.map { |program| program.program_hash } 
	end

	def card_details
			Hash["Name" => self.name,
			"General Rate" => self.general_rate,
			"Rewards Type" => self.rewards_type,
			"Threshold Amount" => self.threshold_amount,
			"Threshold Rate" => self.threshold_rate,
			"Program" => self.program_details
		] 
	end

	def card_hash
		Hash["#{self.name}" => card_details]
	end

end
