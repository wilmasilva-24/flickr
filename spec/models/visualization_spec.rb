require 'rails_helper'

RSpec.describe Visualization, type: :model do
  it {is_expected.to belong_to(:photo)}
end
