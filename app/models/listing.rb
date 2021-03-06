class Listing < ApplicationRecord
  belongs_to :user
  has_many :orders

  has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "default_ducky.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates_attachment_presence :image
end
