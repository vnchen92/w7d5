# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  picture_url     :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'bcrypt'

class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :picture_url, presence: true, default: 

    #spire

    def self.find_by_credentials
    end

    def self.generate_session_token
    end

    def password=(password)
    end

    def is_password?(password)
    end

    def ensure_session_token
    end

    def reset_session_token
    end

    

end
