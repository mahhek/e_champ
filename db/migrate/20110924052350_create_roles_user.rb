class CreateRolesUser < ActiveRecord::Migration
  def self.up
    create_table :roles_users do |t|
      t.references :role, :user
      t.timestamps
    end
  end

  def self.down
    create_table :roles_users
  end
end
