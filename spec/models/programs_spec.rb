require 'spec_helper'

describe Program do
  it { should have_many(:reviews) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }

  subject { FactoryGirl.create(:program) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_uniqueness_of(:url) }

end

describe Program, '#average' do
  it 'returns the average of the users ratings' do
    program = FactoryGirl.create(:program)
    review_1 = FactoryGirl.create(:review, program: program, rating: 2)
    review_2 = FactoryGirl.create(:review, program: program, rating: 5)

    expect(program.average).to eq 3.5
  end
end
