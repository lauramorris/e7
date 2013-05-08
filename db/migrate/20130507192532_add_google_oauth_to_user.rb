class AddGoogleOauthToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :provider_email, :string
  end
end
