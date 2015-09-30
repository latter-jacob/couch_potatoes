require 'spec_helper'

describe Genre do
  it { should have_many(:programs) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

end
