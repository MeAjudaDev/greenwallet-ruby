class User < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :activation_code
      t.string :state, default: 'P'

      t.timestamps
    end
  end
end
