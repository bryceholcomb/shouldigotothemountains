class WundergroundDataAccess
  API_KEY = 'f08a20163a381e74'  # move me out of version control

  def load_data
    build_report(
      date: yesterday_report['history']['observations'][0]['date']['pretty'],
      snow_total: yesterday_report['history']['observations'][0]['snow'].to_i,
      nowcast: conditions_report['current_observation']['nowcast']
    )
  end

  private

  def build_report(options)
    Report.new(
      resort: Report::RESORT_BRECKENRIDGE,
      report_date: Date.parse(options[:date]),
      yesterday_snow_total: options[:snow_total],
      nowcast: options[:nowcast]
    ).save!
  end

  def conditions_report
    HTTParty.get("http://api.wunderground.com/api/#{API_KEY}/conditions/q/CO/Breckenridge.json")
  end

  def yesterday_report
    HTTParty.get("http://api.wunderground.com/api/#{API_KEY}/yesterday/q/CO/Breckenridge.json")
  end
end







