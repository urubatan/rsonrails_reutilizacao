class UserPicture < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :filename
      t.integer :size
      t.string :content_type
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :filename
      t.remove :size
      t.remove :content_type
    end
  end
end
