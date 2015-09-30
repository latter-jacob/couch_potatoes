require 'spec_helper'

describe Program do
  it { should have_many(:reviews) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }

  describe "uniqueness" do
    subject { FactoryGirl.create(:program) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_uniqueness_of(:url) }
  end
end

describe Program, "#get_random_program" do
  it "returns a program object" do
    FactoryGirl.create(:program)
    FactoryGirl.create(:program)

    program = Program.get_random_program(nil)
    expect(program.class).to eq(Program)
  end
end
