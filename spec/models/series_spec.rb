require 'rails_helper'

RSpec.describe Series, type: :model do
  it { is_expected.to have_many :data }
end