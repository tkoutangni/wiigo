# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  group_id    :integer          not null
#  title       :string           not null
#  start_time  :datetime         not null
#  description :text             not null
#  location    :string           not null
#  address     :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  validates :group, :tite, :start_time, :description, :location,
            :address, presence: true

  belongs_to :group
  has_many :rsvps, dependent: :destroy
  has_many :attendees, through: :rsvps, source: :user
end

# has_many :attendees, through: :rsvps, source: :user, -> { where(going: true) }
