class FoodsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@foods = Food.all
	end
	def list
		@foods = Food.all
	end
	def show
		@food = Food.find(params[:id])
	end	
	def new
		@food = Food.new
	end
	def edit
		@food = Food.find(params[:id])
	end
	def create
		@food = Food.new(food_params)
      	if @food.save
      		redirect_to foods_path
      	else
      		#validate
      		render :new
      	end
	end

	def update
		@food = Food.find(params[:id])
    	if @food.update(food_params)
      		redirect_to food_path(@food)
    	else
      		render :edit
      	end
	end
	def destroy
		@food = Food.find(params[:id])
    	@food.destroy
      		redirect_to foods_path
	end

	def food_params
		params.require(:food).permit(:foodname, :foodtype, :price, :store_id)
	end

end
