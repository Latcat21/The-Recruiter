class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :replies
  has_many :relations
 end