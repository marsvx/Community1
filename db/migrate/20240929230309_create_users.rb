class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    # Create users table with default id as primary key
    create_table :users do |t|
      t.string :username, null: false, limit: 15  # Retain username as a normal column
      t.string :email, null: false, limit: 255
      t.string :first_name, null: false, limit: 150  # Changed to snake_case
      t.string :age_range, null: false, limit: 8      # Changed to snake_case
      t.string :password_digest, null: false, limit: 80  # Correctly set for has_secure_password
      t.integer :zipcode                                 # Changed to snake_case
      t.index :email, unique: true
      t.index :username, unique: true  # Add unique index for username if required
    end

    # Add a trigger to prevent username updates
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE OR REPLACE FUNCTION prevent_username_update()
          RETURNS TRIGGER AS $$
          BEGIN
            IF OLD.username IS DISTINCT FROM NEW.username THEN
              RAISE EXCEPTION 'username cannot be changed once set';
            END IF;
            RETURN NEW;
          END;
          $$ LANGUAGE plpgsql;

          CREATE TRIGGER prevent_username_update_trigger
          BEFORE UPDATE ON users
          FOR EACH ROW
          EXECUTE FUNCTION prevent_username_update();
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TRIGGER prevent_username_update_trigger ON users;
          DROP FUNCTION prevent_username_update();
        SQL
      end
    end
  end
end
