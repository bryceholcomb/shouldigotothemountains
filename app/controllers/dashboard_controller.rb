
class DashboardController < ApplicationController
  def index
    @report = Report.last
    @should_go = Report.last.yesterday_snow_total > 0
    @recent_reports = Report.all
  end
end
