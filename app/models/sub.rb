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

class Sub < ActiveRecord::Base
  validates :name, :moderator_id, presence: true
  validates :name, uniqueness: true

  has_many :link_memberships, :inverse_of => :sub
  has_many :links, through: :link_memberships, source: :link
  belongs_to :moderator, foreign_key: :moderator_id, class_name: 'User'

end
