require 'spec_helper'

describe Program do
  it { should have_many(:reviews) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }

  subject { FactoryGirl.create(:program) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_uniqueness_of(:url) }

end
