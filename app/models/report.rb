class Report  < ActiveRecord::Base
  RESORTS = [
    RESORT_BRECKENRIDGE = 'Breckenridge'
  ]

  validates :report_date, :yesterday_snow_total, presence: true
  validates_numericality_of :yesterday_snow_total, greater_than: -1
  validate :has_valid_resort

  private

  def has_valid_resort
    errors.add(:resort, 'is not a valid resort') unless RESORTS.include? resort
  end
end
