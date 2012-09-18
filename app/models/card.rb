class Card < ActiveRecord::Base
  attr_accessible :general_rate, :issuer_id, :name, :rewards_type, :threshold_amount, :threshold_rate
end
