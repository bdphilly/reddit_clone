# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  parent_comment_id :integer
#  link_id           :integer          not null
#  user_id           :integer          not null
#  body              :string(255)      not null
#  created_at        :datetime
#  updated_at        :datetime
#

class Comment < ActiveRecord::Base
  validates :user, :link, :body, presence: true

  belongs_to :link, inverse_of: :comments
  belongs_to :user, inverse_of: :comments

  belongs_to :parent_comment,
             :class_name: "Comment",
             :foreign_key: :parent_comment_id,
             :primary_key: :id

  has_many   :child_comments,
             :class_name: "Comment",
             :foreign_key: :parent_comment_id,
             :primary_key: :id

end
