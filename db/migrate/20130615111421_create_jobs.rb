class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :url
      t.string :organisation
      t.integer :year_started
      t.integer :year_finished
      t.text :content
      t.boolean :publish

      t.timestamps
    end
  end
end
