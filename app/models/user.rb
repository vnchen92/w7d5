# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  picture_url     :string           default("https://cdn-icons-png.flaticon.com/512/1384/1384067.png"), not null
#  birthdate       :date             default(Sat, 01 Jan 2000), not null
#

require 'bcrypt'

class User < ApplicationRecord
    attr_reader :password
    validates :username, uniqueness: true, presence: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :picture_url, presence: true
    validates :session_token, presence: true, uniqueness: true
    validates :birthdate, presence: true
    before_validation :ensure_session_token
    #spire

    has_many :moderated_subs, class_name: :Sub, foreign_key: :moderator_id

    has_many :posts, class_name: :Post, foreign_key: :author_id

    def self.find_by_credentials(username, password)
        @u = User.find_by(username: username)
        return nil if @u.nil?
        @u.is_password?(password) ? @u : nil
    end

    def self.generate_session_token
        self.session_token = SecureRandom::urlsafe_base64(16)
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @oassword = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token
        self.generate_session_token
        self.save!
        self.session_token
    end

end
