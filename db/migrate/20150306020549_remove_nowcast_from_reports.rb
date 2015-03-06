class RemoveNowcastFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :nowcast
  end
end
