class BusinessesController < ApplicationController
	before_action :set_business, only: [:edit, :update, :show, :report, :approve, :disapprove]
	before_action :set_businesses, only: [:edit, :update, :show, :index]
	before_action :authenticate_account!, except: [:index, :show, :report]

	def pundit_user
		current_account
	end

	def show
		@coupons = @business.coupons
		@events = @business.events
	end

	def stats
		@business = Business.find(params[:id])
	end

	# GET /buyers/1/edit
	def edit
		authorize @business
	end

	def approve
		authorize @business
		@business.account.approved = true
		respond_to do |format|
			if @business.account.save
				format.html { redirect_to chambers_approvals_url, notice: "The business #{@business.name} was successfully approved." }
				format.json { head :no_content }
			else
				format.html { redirect_to chambers_approvals_url, notice: "The business #{@business.name} was not successfully approved." }
				format.json { render json: @business.errors, status: :unprocessable_entity }
			end
		end
	end


	def disapprove
		authorize @business
		@business.account.destroy
		respond_to do |format|
			if @business.destroy
				format.html { redirect_to chambers_approvals_url }
				format.json { head :no_content }
			else
				format.html { redirect_to chambers_approvals_url}
				format.json { head :no_content }
			end
		end
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

	def report
		authorize @business
		report = @business.reports.new
	    if(Report.where(:reportable_type => "Business",:reportable_id => @business.id).blank?)
	      
	      report.email = current_account.email
	      report.save
	  else
	  	@reports = Report.where(:reportable_type => "Business",:reportable_id => @business.id)
	  	flag = true
	  	@reports.each do |current_report|
	  		if(current_report.email == current_account.email)
	  			flag = false
	  		end
	  	end
	  	if(flag == true)
	  		report.email = current_account.email
	    	report.save
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