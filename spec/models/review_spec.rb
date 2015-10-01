require 'spec_helper'

describe Review do
  it { should belong_to(:program) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body) }

end
