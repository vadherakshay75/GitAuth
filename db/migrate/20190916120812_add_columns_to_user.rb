class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :git_profile_url, :string
    add_column :users, :login_id, :string
    add_column :users, :avatar_url, :string
    add_column :users, :followers_url, :string
    add_column :users, :organizations_url, :string
    add_column :users, :repos_url, :string
    add_column :users, :last_modified, :datetime
  end
end
