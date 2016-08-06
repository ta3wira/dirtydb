class CreateDimensions < ActiveRecord::Migration
  # avoid using change to remember translation tables
  def up
    create_table :dimensions do |t|
      t.timestamps null: false
    end
    Dimension.create_translation_table! :title => :string
  end

  def down
    drop_table :dimensions
    Dimension.drop_translation_table!
  end
end
