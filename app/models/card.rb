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

	# def program_details amount 
	# 	self.programs.map { |program| program.program_hash(amount) } 
	# end

	# def card_details general_amount, program_amount
	# 		Hash["Name" => self.name,
	# 		"Rewards Type" => self.rewards_type,
	# 		"General Rewards" => general_rewards(general_amount),
	# 		"Program" => self.program_details(program_amount)
	# 	] 
	# end
	def card_details general_amount
			Hash["Name" => self.name,
			"Rewards Type" => self.rewards_type,
			"General Rewards" => general_rewards(general_amount),
		] 
	end


end
