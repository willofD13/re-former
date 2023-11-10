class User < ApplicationRecord
    validate do |user|
        errors.add :username, presence: true, message: "must be provided"
    end
    validates :email, presence: true 
    validates :password, presence: true
end
