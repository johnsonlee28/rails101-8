class Ticket < ApplicationRecord
  validates_presence_of :cinema_name, :quantity, :location
  belongs_to :movie
end
