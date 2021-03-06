# == Schema Information
#
# Table name: link_memberships
#
#  id         :integer          not null, primary key
#  link_id    :integer
#  sub_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe LinkMembership do

  context "validations" do
    let(:incomplete_membership) {LinkMembership.new}

    it "validates presence of sub" do
      expect(incomplete_membership).to have(1).error_on(:sub)
    end

    it "validates presence of link" do
      expect(incomplete_membership).to have(1).error_on(:link)
    end
  end

  it "validates uniqueness of sub/link pairing" do
    lm1 = FactoryGirl.create!(:link_membership)
    lm2 = FactoryGirl.build(:link_membership)

    link_membership1 = LinkMembership.create!({ :sub_id => 1, :link_id => 1 })
    link_membership2 = LinkMembership.new({ :sub_id => 1, :link_id => 1 })

    expect(link_membership2).not_to be_valid
  end

  describe "associations" do
    it { should belong_to(:sub) }
    it { should belong_to(:link) }
  end

end
