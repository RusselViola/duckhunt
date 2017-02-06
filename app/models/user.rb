class User < ApplicationRecord
  has_many :listings, dependent: :destroy
  has_many :sales, class_name: 'Order', foreign_key: 'seller_id'
  has_many :purchases, class_name: 'Order', foreign_key: 'buyer_id'

  validates_format_of :name, with: /\A[\w-]+\z/, message: 'May only contain letters, numbers, dashes, and underscores'
  validates_presence_of :email, :name, :oauth_uid
  validates_uniqueness_of :oauth_uid, :name
end
