# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role
  after_create :send_admin_mail

  def assign_default_role
    add_role(:user) if roles.blank?
  end

  def send_admin_mail
    UserNotifierMailer.send_signup_email(self).deliver
  end
end
