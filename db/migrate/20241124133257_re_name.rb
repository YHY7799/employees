class ReName < ActiveRecord::Migration[7.1]
  def change
    rename_table :ms, :mains
  end
end
