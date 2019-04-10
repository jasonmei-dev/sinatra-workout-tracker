class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises

  validates :name, presence: true
  validates :duration_mins, presence: true
  validates :user_id, presence: true
end
