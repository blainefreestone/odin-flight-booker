require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Flight, type: :model do
  describe "User" do
    describe "abilities" do
      subject(:ability) { Ability.new(user) }
      let(:user) { nil }

      context "when is admin" do
        let(:user) { create(:user, admin: true) }

        it { is_expected.to be_able_to(:manage, build(:flight)) }
      end

      context "when is not admin" do
        let(:user) { create(:user, admin: false) }

        it { is_expected.not_to be_able_to(:manage, build(:flight)) }
        it { is_expected.not_to be_able_to(:create, build(:flight)) }
        it { is_expected.not_to be_able_to(:update, build(:flight)) }
        it { is_expected.to be_able_to(:read, build(:flight)) }
      end
    end
  end
end

# RSpec.describe Flight, type: :model do
#   describe '#around_date' do
#     date = DateTime.new(year=2023, month=12, day=25)
#     context 'check selected' do
#       let(build(:flight)) { create(build(:flight)) } 

#       it 'selects within default date range' do
#         flights = Flight.around_date(date.to_s).to_a
#         expect flights.to include(flight)
#       end

#       it 'selects within custom date range' do

#       end

#       it 'selects multiple within date range' do

#       end
#     end
    
#     context 'check not selected' do
#       it 'does not select outside of date range' do
#         flight = create(build(:flight))
#         flights = Flight.around_date((date).to_s).to_a
#         expect(flights).not_to include(flight)
#       end
#     end
#   end
# end
