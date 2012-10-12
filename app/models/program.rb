class Program < ActiveRecord::Base
  attr_accessible :card_id, :end_period, :name, :reward_limit, :reward_rate, :start_period

  belongs_to :card
  has_many :rewards 
  has_many :categories, :through => :rewards

  def program_details
  	self.categories.map { |category| category.name } 
  end

  def program_hash
  	Hash[
  		"Category" => program_details,
  		"Duration" => (self.end_period.month - self.start_period.month + 1),
  		"Reward Rate" => self.reward_rate,
  		"Reward Limit" => self.reward_limit
  	]
  end

end
