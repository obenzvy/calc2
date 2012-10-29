class Program < ActiveRecord::Base
  attr_accessible :card_id, :end_period, :name, :reward_limit, :reward_rate, :start_period

  belongs_to :card
  has_many :rewards 
  has_many :categories, :through => :rewards

  def duration
    (self.end_period.month - self.start_period.month + 1)
  end

  def reward_limit_check
    if self.reward_limit === 0
      self.reward_limit = 10000000000000000000000
    else
      self.reward_limit
    end
  end

  def excess_spend amount
    if amount * self.duration >= reward_limit_check
        ((amount * self.duration) - self.reward_limit) / self.duration
      else 
        0
    end
  end

  def category_rewards amount 
    if amount * self.duration >= reward_limit_check
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
  		"Reward Amount" => category_rewards(amount),
      "Excess Rewards" => excess_spend(amount)
  	]
  end

end
