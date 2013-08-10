class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.text :content
      t.string :screenshot
      t.string :website_url
      t.string :download_url
      t.string :source_code_url
      t.boolean :publish
      
      t.timestamps
    end
  end
end
