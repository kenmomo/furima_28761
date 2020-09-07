class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :last_name
          validates :first_name
          validates :last_name_furigana
          validates :first_name_furigana
          validates :email
          validates :encrypted_password
          validates :birthday
          end
end
