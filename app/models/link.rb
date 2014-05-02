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
  validates :title, :url, :subs, presence: true
  # validate :valid_url?

  has_many :link_memberships, inverse_of: :link
  has_many :subs, through: :link_memberships, source: :sub
  has_many :comments, inverse_of: :link
  belongs_to(
   :submitter,
   class_name: 'User',
   primary_key: :id,
   foreign_key: :submitter_id,
   inverse_of: :links
   )

   def comments_by_parent
     comments_by_parent = Hash.new { |hash, key| hash[key] = [] }
     Comment.all.each do |comment|
       comments_by_parent[comment.parent_comment_id] << comment
     end
     comments_by_parent
   end

   # def valid_url?
   #   !!URI.parse(self.url)
   # rescue URI::InvalidURIError
   #   errors.add(:errors, "Invalid URL")
   # end

end
