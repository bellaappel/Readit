class User < ActiveRecord::Base
    has_many :reviews
    has_many :books, through: :reviews
    has_secure_password
    validates :username, uniqueness: true
    
    
end

def try_again(message)
    message
end
