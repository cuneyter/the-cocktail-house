require 'rails_helper'

RSpec.describe Cocktail, :type => :model do
  let(:valid_attributes) do
    {
      name: "Mojito"
    }
  end

  it "has a name" do
    cocktail = described_class.new(name: "Mojito")
    expect(cocktail.name).to eq("Mojito")
  end

  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:doses).dependent(:destroy) }
end
