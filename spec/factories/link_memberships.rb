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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_membership do
    link_id 1
    sub_id 1
  end
end
