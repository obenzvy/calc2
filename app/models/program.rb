class Program < ActiveRecord::Base
  attr_accessible :card_id, :end_period, :name, :reward_limit, :reward_rate, :start_period

  belongs_to :card
  has_many :rewards 
  has_many :categories, :through => :rewards

  def duration
    (self.end_period.month - self.start_period.month + 1)
  end

  def category_rewards amount 
    if amount >= self.reward_limit
      self.reward_limit * reward_rate
    else 
      duration * amount * reward_rate
    end
  end 

  def program_details
  	self.categories.map { |category| category.name } 
  end

  def program_hash amount
  	Hash[
  		"Category" => program_details,
  		"Reward Amount" => category_rewards(amount)
  	]
  end

end
