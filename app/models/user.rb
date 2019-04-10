class User < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_secure_password
  
  has_many :workouts

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
