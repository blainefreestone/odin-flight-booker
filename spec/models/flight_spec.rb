require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe '#around_date' do
    date = DateTime.new(year=2023, month=12, day=25)
    context 'check selected' do
      let(:flight) { create(:flight) } 

      it 'selects within default date range' do
        flights = Flight.around_date(date.to_s).to_a
        expect flights.to include(flight)
      end

      it 'selects within custom date range' do

      end

      it 'selects multiple within date range' do

      end
    end
    
    context 'check not selected' do
      it 'does not select outside of date range' do
        flight = create(:flight)
        flights = Flight.around_date((date).to_s).to_a
        expect(flights).not_to include(flight)
      end
    end
  end
end
