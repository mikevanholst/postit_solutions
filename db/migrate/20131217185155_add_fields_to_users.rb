class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_zone, :string
    add_column :users, :phone, :string
    add_column :users, :two_factor_auth, :boolean

  end
end
