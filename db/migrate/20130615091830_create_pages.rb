class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :url
      t.text :content
      t.boolean :publish

      t.timestamps
    end
  end
end
