# frozen_string_literal: true

class Profile < ApplicationRecord
  # assosiations
  belongs_to :user
end
