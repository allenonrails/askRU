class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end

# users
# id | name | username | email | created-at | updated_at


# password * password_salt = password_hash


# password12131313131 * password_salt = password_hash