class UsersController < ApplicationController
	def homepage
		@cards = Card.all
		@issuers = Issuer.all
		@programs = Program.all

		@all = @issuers.map { |issuer| issuer.issuer_hash }

		@general_spend = params[:general_spend].to_i 
		@gas = params[:gas].to_i 
		@movies = params[:movies].to_i
		@museums = params[:museums].to_i 
		@theme_parks = params[:theme_parks].to_i 
		@restaurants = params[:restaurants].to_i 
		@department_stores = params[:department_stores].to_i 

	end
end
