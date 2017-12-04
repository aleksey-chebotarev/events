class Event < ApplicationRecord
  belongs_to :region
  belongs_to :city
  belongs_to :organizer
  belongs_to :place
end
