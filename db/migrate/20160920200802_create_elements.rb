class CreateElements < ActiveRecord::Migration
  # avoid using change to remember translation tables
  def up
    create_table :elements do |t|
      t.integer :dimension_id, default: 0,    null: false
      t.timestamps null: false
    end
    Element.create_translation_table! :description => :text
  end

  def down
    drop_table :elements
    Element.drop_translation_table!
  end
end
