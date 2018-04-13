class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def new
    report = Report.new
    report.save
  end

  def update
  end

  def edit
  end

  def destroy
    @report.destroy
    respond_to do |format|
         format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
         format.json { head :no_content }
    end
  end

  def index
    @reports = Report.all
  end

  def show
  end

  private

    def set_report
      @report = Report.find(params[:id])
    end


end
