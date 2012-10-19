class UsersController < ApplicationController
	def homepage
		@cards = Card.all
		@issuers = Issuer.all
		@programs = Program.all

		# @all = @issuers.map { |issuer| issuer.issuer_hash }

		@general_spend = params[:general_spend].to_i 
		@gas = params[:gas].to_i
		@groceries = params[:groceries].to_i 
		@travel = params[:travel].to_i
		@movies = params[:movies].to_i
		@museums = params[:museums].to_i 
		@theme_parks = params[:theme_parks].to_i 
		@restaurants = params[:restaurants].to_i 
		@department_stores = params[:department_stores].to_i 

		@inputs = {"Gas" => @gas, "Movies" => @movies, "Museums" => @museums, 
			"Theme Parks" => @theme_parks, "Restaurants" => @restaurants, 
			"Department Stores" => @department_stores}


		@arry =[]
		@cards.each do |card|
		card_arry = []
			card_hash = card.card_details(@general_spend) 
			card_arry << card_hash["Name"] #Name [0]
			category_rewards = []			
			card_arry << card_hash["Rewards Type"] #Rewards Type [1]
			card.programs.each do |program|
					program_rewards = []
					program.program_details.each do |category|
						@inputs.each do |key, value|
							if category == key
							program_rewards << value
							end
						end
					end
			program.program_hash(program_rewards.sum)  
			category_rewards << program.program_hash(program_rewards.sum)["Reward Amount"] 
			end 
			card_arry << card_hash["General Rewards"] + category_rewards.sum #Total Rewards [2] 
			card_arry << card_hash["General Rewards"] #general rewards [3]
			card_arry << category_rewards.sum #category rewards [4]
		@arry << card_arry
		end
		@arry.sort_by! { |i| i[2] }.reverse!

		@first = @arry.first
		@second = @arry.second
		@third = @arry.third
	end
end
