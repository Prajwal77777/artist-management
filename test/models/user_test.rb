# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  dob             :string
#  email           :string
#  first_name      :string
#  gender          :integer
#  last_name       :string
#  password_digest :string
#  phone           :string
#  role            :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
