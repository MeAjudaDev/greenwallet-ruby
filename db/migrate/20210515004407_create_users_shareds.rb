class CreateUsersShareds < ActiveRecord::Migration[6.1]
  def change
    create_table :users_shareds do |t|
      # t.references :owner, foreign_key: { to_table: 'users' }
      # t.references :shared, foreign_key: { to_table: 'users' }
      t.references :owner, foreign_key: { to_table: 'users' }
      t.integer :shared_id
      t.string :state, default: 'P'

      t.timestamps
    end
  end
end
