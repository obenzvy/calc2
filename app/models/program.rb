class Program < ActiveRecord::Base
  attr_accessible :card_id, :end_period, :name, :reward_limit, :reward_rate, :start_period

  belongs_to :card
  has_many :rewards 

end
