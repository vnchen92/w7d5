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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
