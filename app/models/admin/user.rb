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
class User < ApplicationRecord
  has_secured_password
  enum :role, { super_user: 0, artist_manager: 1, artist: 2 }
  enum :gender, { male: 0, female: 1, other: 2 }
end
