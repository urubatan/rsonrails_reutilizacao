class CreateUserProjects < ActiveRecord::Migration
  def self.up
    create_table :user_projects do |t|
      t.references :user
      t.references :project
      t.boolean :owner

      t.timestamps
    end
  end

  def self.down
    drop_table :user_projects
  end
end
