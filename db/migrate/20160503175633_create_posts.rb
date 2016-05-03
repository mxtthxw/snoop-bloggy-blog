class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.integer :post_tags_id
      t.boolean :comments_on

      t.timestamps null: false
    end
  end
end
