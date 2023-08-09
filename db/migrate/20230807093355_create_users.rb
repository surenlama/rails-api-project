class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.integer :age
      t.integer :gender
      t.string :email
      t.string :password
      t.string :token
      t.datetime :birth_date
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
