class Exercise < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :workout

  validates :name, presence: true
  validates :workout_id, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
end
