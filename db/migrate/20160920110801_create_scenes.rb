class CreateScenes < ActiveRecord::Migration
  # avoid using change to remember translation tables
  def up
    create_table :scenes do |t|
      t.integer :sampling, default: 10,    null: false
      t.integer :length, default: 0,    null: false
      t.timestamps null: false
    end

    Scene.create_translation_table! :title => :string
  end

  def down
    drop_table :scenes
    Scene.drop_translation_table!
  end
end
