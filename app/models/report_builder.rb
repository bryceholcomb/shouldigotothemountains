class ReportBuilder
  def initialize(resort_data)
    @data = resort_data
  end

  def build_report
    Report.new(
      mountain: data[:mountain],
      yesterday_snow_total: data[:yesterday_snow_total],
      report_date: build_date
    ).save!
  end

  private

  attr_reader :data

  def build_date
    Date.parse(data[:report_date])
  end
end

