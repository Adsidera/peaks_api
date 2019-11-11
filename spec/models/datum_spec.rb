require 'rails_helper'

RSpec.describe Datum, type: :model do
  it { is_expected.to have_attribute :value }
  it { is_expected.to have_attribute :day }
end