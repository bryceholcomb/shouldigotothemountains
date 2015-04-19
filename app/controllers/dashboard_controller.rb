
class DashboardController < ApplicationController
  respond_to :json, :html

  def index
    @recent_reports = Report.all.order(yesterday_snow_total: :desc)
    @report = @recent_reports.first
    @should_go = @report.yesterday_snow_total > 3

    respond_with @recent_reports
  end
end
