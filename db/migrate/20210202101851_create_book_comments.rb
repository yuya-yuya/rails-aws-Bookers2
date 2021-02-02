class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.text :comment
      t.integer :user_id
      post_image_id :integer

      t.timestamps
    end
  end
end
