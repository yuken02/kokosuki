class Tag < ApplicationRecord
  has_many :tagging, dependent: :destroy
end
