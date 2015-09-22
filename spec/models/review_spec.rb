require 'spec_helper'

describe Review do
  it { should belong_to(:program) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:rating) }
  it { should validate_numericality_of(:rating) }
  it { should validate_length_of(:rating) }

end
