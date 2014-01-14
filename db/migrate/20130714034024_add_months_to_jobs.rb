class AddMonthsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :month_started, :integer, default: 0
    add_column :jobs, :month_finished, :integer, default: 0
  end
end
