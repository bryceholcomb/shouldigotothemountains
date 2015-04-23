class Report  < ActiveRecord::Base
  validates :report_date, :yesterday_snow_total, :mountain, presence: true
  validates_numericality_of :yesterday_snow_total, greater_than: -1
end
