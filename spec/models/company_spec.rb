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

  it "responds with its phone numbers after they're created" do
    phone_number = company.phone_numbers.build(number: '333-4444')
    expect(phone_number.number).to eq('333-4444')
  end

  it "responds with its email addresses after they're created" do
    email = company.email_addresses.build(address: 'me@example.com')
    expect(email.address).to eq('me@example.com')
  end

end
