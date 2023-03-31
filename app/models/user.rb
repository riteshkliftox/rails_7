# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # assosiations
  has_one :profile

  # callbackes
  after_create :assign_default_role, :send_admin_mail, :add_profile

  def assign_default_role
    add_role(:user) if roles.blank?
  end

  def send_admin_mail
    UserNotifierMailer.send_signup_email(self).deliver
  end

  def add_profile
    create_profile
  end
end
