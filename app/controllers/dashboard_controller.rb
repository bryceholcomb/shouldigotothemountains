
class DashboardController < ApplicationController
  before_action :load_data

  def index
    @report = Report.last
    @should_go = Report.last.yesterday_snow_total > 0
    @recent_reports = Report.all
  end

  private

  def load_data
    WundergroundDataAccess.new.load_data unless reports_updated_recently?
  end

  def reports_updated_recently?
    Report.last.report_date == Date.today - 1 || Date.today
  end
end
