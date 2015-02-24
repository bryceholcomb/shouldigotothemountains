class Report  < ActiveRecord::Base
  validates :report_date, :yesterday_snow_total, presence: true
  validates_numericality_of :yesterday_snow_total, greater_than: -1
  validate :has_valid_mountain

  private

  def has_valid_mountain
    errors.add(:mountain, 'is not a valid mountain') unless Mountains::MOUNTAINS.include? mountain
  end
end
