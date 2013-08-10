class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :url
      t.string :email_address
      t.string :password_digest
      t.string :authentication_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :role

      t.timestamps
    end
  end
end
