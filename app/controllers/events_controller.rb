class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :like, :unlike, :report]

  def pundit_user
    current_account
  end

  # GET /events
  # GET /events.json
  def index
    if(params[:business_id])


      upcoming_events_all = Event.where("end_time >= ?", Time.now).where(:business_id => params[:business_id])
      @upcoming_events = []
      upcoming_events_all.each do |c|
        if(c.business.account.approved == true)
          @upcoming_events << c
        end
      end

      events_all = Event.where(:business_id => params[:business_id])
      @events = []
      events_all.each do |c|
        if(c.business.account.approved == true)
          @events << c
        end
      end

      @all_events = Event.where(:business_id => params[:business_id]).sort_by{|c| c.start_time }

    else

      upcoming_events_all = Event.where("end_time >= ?", Time.now)
      @upcoming_events = []
      upcoming_events_all.each do |c|
        if(c.business.account.approved == true)
          @upcoming_events << c
        end
      end

      events_all = Event.all
      @events = []
      events_all.each do |c|
        if(c.business.account.approved == true)
          @events << c
        end
      end

    end


  end

  # GET /events/1
  # GET /events/1.json
  def show
    if(@event.popularity.nil?)
      @event.popularity = 0
    end
    @event.popularity +=1
    @event.save  
  end

  # GET /events/new
  def new
    begin
      @event = Event.new
      authorize @event
    rescue Exception
      redirect_to business_events_url(current_account.accountable_id)
    end
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    authorize @event

    if(current_account && current_account.accountable_type == "Business")
      @event.business = current_account.accountable
    end


    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    authorize @event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize @event
    @event.destroy
    respond_to do |format|
      if(current_account and current_account.accountable_type == "Business")
        format.html { redirect_back fallback_location: root_path, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_back fallback_location: root_path, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def like
    @event.liked_by current_account
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)  }
      format.js
      end
   end

  def unlike
    @event.unliked_by current_account
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path)  }
      format.js
      end
   end

  def report
    report = @event.reports.new
    if(Report.where(:reportable_type => "Event",:reportable_id => @event.id).blank?)
      
      report.email = current_account.email
      report.save
    else
      @reports = Report.where(:reportable_type => "Event",:reportable_id => @event.id)
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
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :image_url, :address, :start_time, :end_time, :fblink)
    end
end
