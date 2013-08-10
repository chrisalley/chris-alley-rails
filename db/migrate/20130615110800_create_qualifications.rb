class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name
      t.string :url
      t.string :education_provider
      t.integer :year_completed
      t.text :content
      t.string :certificate
      t.boolean :publish
      
      t.timestamps
    end
  end
end
