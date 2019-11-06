class Series < ApplicationRecord
  has_many :data, dependent: :destroy
end
