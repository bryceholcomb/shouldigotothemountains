class ColoradoScraper
  URL = 'http://www.onthesnow.com/colorado/skireport.html'
  TABLE_ROWS = (3..24)

  def initialize
    @page = Mechanize.new.get(URL)
  end

  def scrape_reports
    TABLE_ROWS.each do |i|    #This is shitty
      row = get_table_row(i)

      resort_data = {
        mountain: mountain_name(row),
        yesterday_snow_total: snow_total(row),
        report_date: report_date(row)
      }

      ReportBuilder.new(resort_data).build_report
    end
  end

  private

  attr_reader :page

  def get_table_row(row_index)
    page.at('tr:eq('+row_index.to_s+')').text
  end

  def mountain_name(row)
    row.lines[3].strip
  end

  def snow_total(row)
    row.lines[14].strip.gsub('"','')
  end

  def report_date(row)
    row.lines[5].strip.delete('Last Updated: ')
  end
end
