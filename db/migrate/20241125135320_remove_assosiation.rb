class RemoveAssosiation < ActiveRecord::Migration[7.1]
  def change
    remove_index :overtimes, :employee_id
    remove_column :overtimes, :employee_id
    remove_index :debits, :employee_id
    remove_column :debits, :employee_id
  end
end
