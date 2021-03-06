class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy, :like, :unlike, :report]
  
  # GET /coupons
  # GET /coupons.json

  def pundit_user
    current_account
  end

  def index
    if(params[:business_id])
      @business = Business.find(params[:business_id])
      @coupons = @business.coupons

    else
      coupons_all = Coupon.where("start_time <= ? and end_time >= ?", Time.now, Time.now )
      @coupons = []
      coupons_all.each do |c|
        if(c.business.account.approved == true)
          @coupons << c
        end
      end
    end


     respond_to do |format|
      format.html{}
      format.json {render json: Coupon.order(sort_by + ' ' + order)}
      
      end



  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    if(@coupon.popularity.nil?)
      @coupon.popularity = 0
    end
    @coupon.popularity +=1
    @coupon.save  
  end

  # GET /coupons/new
  def new  
   # begin
      @coupon = Coupon.new
      authorize @coupon
    #rescue Exception
     # redirect_to business_coupons_url(current_account.accountable_id)
    #end
  end

  # GET /coupons/1/edit
  def edit
    authorize @coupon
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(coupon_params)
    authorize @coupon

    if(current_account && current_account.accountable_type == "Business")
      @coupon.business = current_account.accountable
    end

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    authorize @coupon
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    authorize @coupon
    @coupon.destroy
    respond_to do |format|
      if(current_account and current_account.accountable_type = "Business")
         format.html { redirect_back fallback_location: root_path, notice: 'Coupon was successfully destroyed.' }
         format.json { head :no_content }
      else
         format.html { redirect_back fallback_location: root_path, notice: 'Coupon was successfully destroyed.' }
         format.json { head :no_content }
      end
    end
  end

  def like
    @coupon.liked_by current_account
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
      end
   end

  def unlike
    @coupon.unliked_by current_account
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
      end
   end

  def report
    authorize @coupon
    report = @coupon.reports.new
    if(Report.where(:reportable_type => "Coupon",:reportable_id => @coupon.id).blank?)
      report.email = current_account.email
      report.save
    else
      @reports = Report.where(:reportable_type => "Coupon",:reportable_id => @coupon.id)
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
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:title, :description, :image_url, :start_time, :end_time, :category)
    end

    def sort_by
       %w(title).include?(params[:sort_by]) ? params[:sort_by] : 'title'
    end
    def order
       %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
    end

    
    
end
