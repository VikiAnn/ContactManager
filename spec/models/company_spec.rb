require 'rails_helper'

RSpec.describe Company, :type => :model do
  let(:valid_attributes) { {name: "Big Corp, Inc."} }
  let(:company) { Company.create(valid_attributes) }

  it 'is valid' do
    expect(company).to be_valid
  end

  it 'is invalid without a name' do
    company = Company.create(name: nil)
    expect(company).not_to be_valid
  end

  it 'has an array of phone numbers' do
    expect(company.phone_numbers).to eq([])
  end
end
