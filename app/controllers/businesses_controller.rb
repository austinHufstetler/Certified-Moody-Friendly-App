class BusinessesController < ApplicationController
	before_action :set_business, only: [:edit, :update, :show]
	before_action :set_businesses, only: [:edit, :update, :show, :index]
	before_action :authenticate_account!, except: [:index, :show]

	def pundit_user
		current_account
	end

	def show
		@coupons = @business.coupons
		@events = @business.events
	end

	# GET /buyers/1/edit
	def edit
		authorize @business
	end
	# PATCH/PUT /buyers/1
	# PATCH/PUT /buyers/1.json
	def update
		authorize @business
		respond_to do |format|
			if @business.update(business_params)
				format.html { redirect_to home_index_url, notice: "The profile of the business #{@business.name} was successfully updated." }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @business.errors, status: :unprocessable_entity }
			end
		end
	end
	

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_business
		@business = Business.find(params[:id])
	end

	def set_businesses
		@businesses = Business.all
	end

	def business_params
		params.require(:business).permit(:name, :address, :logo_url)
	end
end