require 'spec_helper'

RSpec.describe Comment, type: :model do
  let(:movie) {create :movie}
  let(:comment) {create :comment}

  it 'has a valid factory' do
    comment = build :comment
    expect(comment).to be_valid
  end

  it {expect(comment).to validate_presence_of(:text)}

  it {expect(comment).to belong_to(:user)}
  it {expect(comment).to belong_to(:move)}

end