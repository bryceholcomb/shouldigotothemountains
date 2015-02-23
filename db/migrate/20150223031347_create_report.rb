class CreateReport < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :resort
      t.date :report_date
      t.integer :yesterday_snow_total
      t.text :nowcast
      t.timestamps
    end
  end
end
