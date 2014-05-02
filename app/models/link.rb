require 'URI'
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

class Link < ActiveRecord::Base
  validates :title, :url, presence: true
  validates :url, :format => URI::regexp(%w(http https))

  has_many :link_memberships,inverse_of: :link
  has_many :subs, through: :link_memberships, source: :sub
  belongs_to(
   :submitter,
   class_name: 'User',
   primary_key: :id,
   foreign_key: :submitter_id

   )



end
