# == Schema Information
#
# Table name: links
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  url          :string(255)      not null
#  text         :string(255)
#  submitter_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'
require 'faker'

describe Link do
  describe "Validations" do
    context "without url, title, or submitter_id" do
      let(:incomplete_link) { Link.new }

      it "validates presence of title" do
        expect(incomplete_link).to have(1).error_on(:title)
      end

      it "validates presence of url" do
        expect(incomplete_link).to have_at_least(1).error_on(:url)
      end

      it "validates presence of submitter_id" do
        expect(incomplete_link).to have(1).error_on(:submitter_id)
      end
    end

    context "validates validity of URL" do
      url = Faker::Internet.domain_name
      let (:invalid_link) { Link.create(url: "hello",
        title: "title", submitter_id: 1) }

      it "rejects invalid URL" do
        expect(invalid_link).to have(1).error_on(:url)
      end
    end
  end

  describe "Associations" do
    it { should belong_to(:submitter) }
    it { should have_many(:subs) }
    it { should have_many(:link_memberships) }
  end
end