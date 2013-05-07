# app/models/user.rb

class User < ActiveRecord::Base
  attr_accessible :lbs_email, :name
  validates :name, :presence => true
  validates :lbs_email, :format => { :with => /@london.edu$/i,
    :message => "must be an @london.edu address" }
end
