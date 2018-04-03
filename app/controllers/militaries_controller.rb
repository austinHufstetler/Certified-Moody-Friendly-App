class MilitariesController < ApplicationController
	before_action :set_military, only: [:edit, :update]
	before_action :authenticate_account!

	def pundit_user
		current_account
	end

	# GET /buyers/1/edit
	def edit
		authorize @military
	end

	def my_page
		@liked_stuff = current_account.find_liked_items
	end

	# PATCH/PUT /buyers/1
	# PATCH/PUT /buyers/1.json
	def update
		authorize @military
		respond_to do |format|
			if @military.update(military_params)
				format.html { redirect_to home_index_url, notice: "The profile of the military #{@military.name} was successfully updated." }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @military.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_military
		@military = Military.find(params[:id])
	end

	def military_params
		params.require(:military).permit(:name, :address, :branch)
	end
end