require 'rails_helper'

RSpec.describe Stop, type: :model do

  it { should have_valid(:name).when("Johnny")}
  it { should_not have_valid(:name).when(nil,"")}
end
