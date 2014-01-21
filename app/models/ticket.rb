class Ticket < ActiveRecord::Base
  validates :number, presence: true, numericality: { greater_than: 0 }
end
