class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :wishlist_products, through: :wishlists


  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates_uniqueness_of :email_address, case_sensitive: false
  validates :first_name, :last_name, presence: true

  attr_readonly :admin

  generates_token_for :email_confirmation, expires_in: 7.days do
    unconfirmed_email
  end

  def confirm_email
    update(email_address: unconfirmed_email, unconfirmed_email: nil)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
