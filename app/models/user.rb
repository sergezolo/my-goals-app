class User < ActiveRecord::Base
    has_many :goals
    has_secure_password
    validates :name, :email, :password, presence: true
end