class AddCartIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :user_id, :integer
    # クラス名とは逆のことをしている
  end
end
