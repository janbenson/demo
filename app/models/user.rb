class User < ActiveRecord::Base
   attr_accessible :email, :password, :password_confirmation, :zip , :type, :profile_attributes, :id
 
  has_secure_password
  validates_presence_of :password, :on => :create
  
  has_one :profiles
  accepts_nested_attributes_for :profiles
  end
