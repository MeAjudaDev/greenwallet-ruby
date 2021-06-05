class CreateSettingsGraphics < ActiveRecord::Migration[6.1]
  def change
    create_table :settings_graphics do |t|
      t.boolean :private_values_mode
      t.integer :type_graphic
      t.integer :time_course
      t.string  :type_class
      t.references :owner, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
