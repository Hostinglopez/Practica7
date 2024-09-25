class User < ApplicationRecord
  validates_presence_of :name, presence: true
  validates_format_of :name, :with => /\A[a-zA-Z]+\z/
  validates :name, length: { maximum: 15 },on: :create

 #para password
  validates_presence_of :password, presence: true
  validates_length_of :password, is: 8

  #para gmail
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid'

end
