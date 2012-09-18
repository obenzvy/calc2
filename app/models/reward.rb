class Reward < ActiveRecord::Base
  attr_accessible :category_id, :program_id

  belongs_to :program
  belongs_to :category


end
