class AppConfig < ApplicationRecord
  validate  :single_instance, on: :create
  validates :number_of_upcoming_days, inclusion: { in: 1..3 }

  def self.number_of_upcoming_days
    settings.number_of_upcoming_days
  end

  private

  def self.settings
    first_or_create
  end

  def single_instance
    errors[:base] << 'There can be only one.' if AppConfig.count >= 1
  end
end
