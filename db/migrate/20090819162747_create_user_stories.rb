class CreateUserStories < ActiveRecord::Migration
  def self.up
    create_table :user_stories do |t|
      t.references :project
      t.references :story_state
      t.references :user
      t.integer :sprint
      t.integer :points
      t.string :title
      t.string :as_a
      t.string :i_want_to
      t.string :so_that
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :user_stories
  end
end
