class ReportsController < ApplicationController
  require 'set'
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
    Report.where(:reportable_id => @report.reportable_id, :reportable_type => @report.reportable_type).destroy_all
    respond_to do |format|
         format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
         format.json { head :no_content }
    end
  end

  def index
    @reports = Set[]
    reports = Report.all
    reports.each do |report|
      report_collection = Report.where(:reportable_type => report.reportable_type,:reportable_id => report.reportable_id)
      final_report = report_collection.first
      final_report.count = report_collection.count
      @reports << final_report

    end
  end

  def show
  end

  private

    def set_report
      @report = Report.find(params[:id])
    end


end
