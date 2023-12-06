require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Airport, type: :model do
  describe "User" do
    describe "abilities" do
      subject(:ability) { Ability.new(user) }
      let(:user) { nil }

      describe "when is admin" do
        let(:user) { create(:user, admin: true) }

        it { is_expected.to be_able_to(:manage, build(:airport)) }
      end

      describe "when is not admin" do
        let(:user) { create(:user, admin: false) }

        it { is_expected.not_to be_able_to(:read, build(:airport)) }
        it { is_expected.not_to be_able_to(:create, build(:airport)) }
        it { is_expected.not_to be_able_to(:update, build(:airport)) }
        it { is_expected.not_to be_able_to(:destroy, build(:airport)) }
      end
    end
  end
end
