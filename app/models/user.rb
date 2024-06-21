require 'openssl'

class User < ApplicationRecord
  ITERATTIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions, dependent: :destroy

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  attr_accessor :password, :password_confirmation

  validates :password, presence: true, confirmation: true, on: :create
  validates :password_confirmation, presence: true

  before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
            password, user.password_salt, ITERATTIONS, DIGEST.length, DIGEST
        )
    )

    return user if user.password_hash == hashed_password

    nil
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  private 

  def encrypt_password
    if password.present?
        self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

        self.password_hash = User.hash_to_string(
            OpenSSL::PKCS5.pbkdf2_hmac(
                password, password_salt, ITERATTIONS, DIGEST.length, DIGEST
            )
        )
    end
  end

#   before_validation 
#   after_validation 

#   before_save
#   after_save 

#   before_create
#   after_create

#   before_update 
#   after_update 

#   before_destroy
#   after_destroy

#   before_commit

#   before_transtaction

end
