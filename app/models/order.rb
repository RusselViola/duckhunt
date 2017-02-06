class Order < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User'

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates_format_of :zip_code, :with => /^\d{5}(-\d{4})?$/, :message => "Should be in the form 12345 or 12345-1234"
end
