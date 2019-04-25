require 'rails_helper'

RSpec.describe Review, type: :model do

  it { should have_valid(:rating).when(1)}
  it { should_not have_valid(:rating).when(10)}
  it { should_not have_valid(:rating).when(nil, "")}
  it { should have_valid(:body).when("grayworm")}
  it { should_not have_valid(:body).when(nil, "")}
end
