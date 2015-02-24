class ReportBuilder
  API_KEY = 'f08a20163a381e74'  # move me out of version control

  def breckenridge
    build_report(
      mountain: Mountains::BRECKENRIDGE,
      date: yesterday_report(Mountains::BRECKENRIDGE)['history']['observations'][0]['date']['pretty'],
      snow_total: yesterday_report(Mountains::BRECKENRIDGE)['history']['observations'][0]['snow'].to_i,
      nowcast: conditions_report(Mountains::BRECKENRIDGE)['current_observation']['nowcast']
    )
  end

  def keystone
    build_report(
      mountain: Mountains::KEYSTONE,
      date: yesterday_report(Mountains::KEYSTONE)['history']['observations'][0]['date']['pretty'],
      snow_total: yesterday_report(Mountains::KEYSTONE)['history']['observations'][0]['snow'].to_i,
      nowcast: conditions_report(Mountains::KEYSTONE)['current_observation']['nowcast']
    )
  end

  private

  def build_report(options)
    Report.new(
      mountain: options[:mountain],
      report_date: Date.parse(options[:date]),
      yesterday_snow_total: options[:snow_total],
      nowcast: options[:nowcast]
    ).save!
  end

  def conditions_report(call_name)
    HTTParty.get("http://api.wunderground.com/api/#{API_KEY}/conditions/q/CO/#{call_name}.json")
  end

  def yesterday_report(call_name)
    HTTParty.get("http://api.wunderground.com/api/#{API_KEY}/yesterday/q/CO/Breckenridge.json")
  end
end







