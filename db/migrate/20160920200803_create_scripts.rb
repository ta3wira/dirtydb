class CreateScripts < ActiveRecord::Migration
  # avoid using change to remember translation tables
  def up
    create_table :scripts do |t|
      t.integer :scene_id, default: 0,    null: false, index: true
      t.integer :element_id, default: 0,    null: false, index: true
      t.integer :sequence, default: 0,    null: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :scripts
  end
end
