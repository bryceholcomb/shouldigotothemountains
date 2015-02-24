namespace :reports do
  desc 'Pull in last week of reports'
  task update_reports: :environment  do
    Report.destroy_all

    Mountains::MOUNTAINS.each do |mountain|
      ReportBuilder.new.send(mountain.downcase)
      puts "Generated report for: #{mountain}"
    end

    puts "Total: #{Report.count}"
  end
end
