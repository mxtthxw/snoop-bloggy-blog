class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :age
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
