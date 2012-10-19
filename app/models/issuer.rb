class Issuer < ActiveRecord::Base
  attr_accessible :name

  has_many :cards

  # def card_details amount
  #  self.cards.map { |card| card.card_details(amount) }
  # end


  # def issuer_hash amount
  #  Hash["Name" => self.name,
  #   "Cards" => card_details(amount)
  #  ]
  # end

end
