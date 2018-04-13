class ChambersController < ApplicationController
	before_action :set_chamber, only: [:edit, :update]
	before_action :authenticate_account!
	# GET /buyers/1/edit
	def edit
	end

	def approvals
		pending_accounts = Account.where(:accountable_type=>"Business", :approved=>false)
		@pending_businesses = []
		pending_accounts.each do |account|
			business = Business.find(account.accountable_id)
  			@pending_businesses<< business
		end


	end

	# PATCH/PUT /buyers/1
	# PATCH/PUT /buyers/1.json
	def update
		respond_to do |format|
			if @chamber.update(chamber_params)
				format.html { redirect_to home_index_url, notice: "The profile of the chamber was successfully updated." }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @chamber.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_chamber
		@chamber = Chamber.find(params[:id])
	end


	def chamber_params
		params.require(:chamber).permit(:address)
	end
end