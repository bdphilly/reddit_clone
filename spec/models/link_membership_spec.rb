require 'spec_helper'

describe LinkMembership do

  context "validations" do
    let(:incomplete_membership) {LinkMembership.new}

    it "validates presence of sub" do
      expect(incomplete_membership).to have(1).error_on(:sub_id)
    end

    it "validates presence of link" do
      expect(incomplete_membership).to have(1).error_on(:link_id)
    end
  end

  it "validates uniqueness of sub/link pairing" do
    link_membership1 = LinkMembership.create!({ :sub_id => 1, :link_id => 1 })
    link_membership2 = LinkMembership.new({ :sub_id => 1, link_id => 1 })

    expect(link_membership2).not_to be_valid
  end

  describe "associations" do
    it { should belong_to :sub }
    it { should belong_to :link }
  end

end