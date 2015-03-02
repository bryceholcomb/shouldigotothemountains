namespace :reports do
  desc 'Scrape, build all Colorado reports from OpenSnow'
  task scrape_colorado_reports: :environment  do
    Report.destroy_all

    ColoradoScraper.new.scrape_reports

    puts "Added #{Report.count} new reports"
  end
end
