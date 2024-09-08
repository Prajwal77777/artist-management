class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.integer :gender
      t.integer :role
      t.string :dob
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
