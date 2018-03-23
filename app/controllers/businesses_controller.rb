class BusinessesController < ApplicationController
	before_action :set_business, only: [:edit, :update]
	before_action :authenticate_account!
	# GET /buyers/1/edit
	def edit
	end
	# PATCH/PUT /buyers/1
	# PATCH/PUT /buyers/1.json
	def update
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

	def business_params
		params.require(:business).permit(:name, :address)
	end
end