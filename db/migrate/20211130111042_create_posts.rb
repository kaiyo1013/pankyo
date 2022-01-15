class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :genre
      t.text :question

      t.timestamps
    end
  end
end
