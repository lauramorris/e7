# app/models/user.rb

class User < ActiveRecord::Base
  attr_accessible :lbs_email, :name, :uid, :provider, :provider_email

  validates :name, :presence => true
  validates :lbs_email, :on => :update, :format => { :with => /@london.edu$/i,
    :message => "must be an @london.edu address" }
  
  validates_uniqueness_of :uid, :scope => :provider
end
