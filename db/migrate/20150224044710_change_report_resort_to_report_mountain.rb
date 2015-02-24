class ChangeReportResortToReportMountain < ActiveRecord::Migration
  def change
    rename_column :reports, :resort, :mountain
  end
end
