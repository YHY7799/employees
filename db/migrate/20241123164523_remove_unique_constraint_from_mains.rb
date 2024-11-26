class RemoveUniqueConstraintFromMains < ActiveRecord::Migration[7.0]
  def up
    # Remove the existing index if it exists
    remove_index :mains, [:year, :month] if index_exists?(:mains, [:year, :month])
    
    # Add a new non-unique index for performance
    add_index :mains, [:year, :month, :name]
  end

  def down
    remove_index :mains, [:year, :month, :name]
    add_index :mains, [:year, :month], unique: true
  end
end