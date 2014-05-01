# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  moderator_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Sub do

  describe "Validations" do
    context "without name or moderator_id" do
      let(:incomplete_sub) { Sub.new }

      it "validates presence of name" do
        expect(incomplete_sub).to have(1).error_on(:name)
      end

      it "validates presence of moderator_id" do
        expect(incomplete_sub).to have(1).error_on(:moderator_id)
      end
    end

    it "validates uniqueness of name" do
      sub1 = Sub.create!({:name =>"News", :moderator_id => 1 })
      sub2 = Sub.new({:name =>"News", :moderator_id => 1 })

      expect(sub2).not_to be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:links) }
    it { should belong_to(:moderator) }
    it {should have_many(:link_memberships) }
  end

end

