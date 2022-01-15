class AddUniversityToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :university, :string
  end
end
