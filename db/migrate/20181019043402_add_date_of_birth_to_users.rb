class AddDateOfBirthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :date, :date
  end
end
