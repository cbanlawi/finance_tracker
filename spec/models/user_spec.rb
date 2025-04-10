require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_many(:expenses).dependent(:destroy) }
  end
end
