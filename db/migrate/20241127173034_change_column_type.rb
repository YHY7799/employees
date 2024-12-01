class ChangeColumnType < ActiveRecord::Migration[7.1]
  def change
    change_column :opayments, :payment_method, :integer, default: 0
  end
end
