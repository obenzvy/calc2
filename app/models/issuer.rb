class Issuer < ActiveRecord::Base
  attr_accessible :name

  has_many :cards

  def card_details
   self.cards.map { |card| card.card_details }
  end


  def issuer_hash
   Hash["Name" => self.name,
    "Cards" => card_details
   ]
  end

end
