class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tw_token, :string
    add_column :users, :tw_token_secret, :string
  end
end
