class CreateStoryStates < ActiveRecord::Migration
  def self.up
    create_table :story_states do |t|
      t.string :name
      t.int :order
      t.boolean :user_visible
      t.visible :project_owner

      t.timestamps
    end
  end

  def self.down
    drop_table :story_states
  end
end
