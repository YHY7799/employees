class AddFKey < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :main, foreign_key: true
  end
end
