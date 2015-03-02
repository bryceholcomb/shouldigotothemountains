
class DashboardController < ApplicationController
  def index

    # Give me some love! Better should_i_go logic, explodes if no reports present

    @recent_reports = Report.all.order(yesterday_snow_total: :desc)
    @report = @recent_reports.first
    @should_go = @report.yesterday_snow_total > 3
  end
end
