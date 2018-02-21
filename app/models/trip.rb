class Trip < ApplicationRecord
  validates :driver, presence: true
  validates :state, presence: true
end
