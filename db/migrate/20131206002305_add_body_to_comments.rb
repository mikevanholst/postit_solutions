class AddBodyToComments < ActiveRecord::Migration
  def change
    add_column :comments, :body, :text
    remove_column :comments, :content, :text
    
  end
end
