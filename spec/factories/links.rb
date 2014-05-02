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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    sequence title "MyString"
    url "MyString"
    text "MyString"
    submitter_id 123
  end
end
