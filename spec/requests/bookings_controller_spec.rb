require 'rails_helper'

RSpec.describe "BookingsControllers", type: :request do
  describe "GET /index" do
    # subject(:request) { get bookings_path }
    let(:user) { nil }

    it "request okay when current user is admin" do
      user = create(:user, admin: true)
      sign_in user

      get bookings_path
      expect(response).to have_http_status(:ok)
    end

    # it "request not okay when current user is nil" do
    #   get bookings_path
    #   is_expected.to raise_error
    # end

    # it "request not okay when current user is not admin" do
    #   user = create(:user, admin: false)
    #   sign_in user

    #   get bookings_path
    #   expect(response).not_to have_http_status(:ok)
    # end
  end
end
