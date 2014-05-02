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

class LinkMembership < ActiveRecord::Base
  validates :link, :sub, presence: true
  validates_uniqueness_of :link_id, :scope => :sub_id

  belongs_to(
    :link,
    class_name: "Link",
    primary_key: :id,
    foreign_key: :link_id,
    inverse_of: :link_memberships
  )

  belongs_to(
    :sub,
    class_name: "Sub",
    primary_key: :id,
    foreign_key: :sub_id,
    inverse_of: :link_memberships
  )

end
