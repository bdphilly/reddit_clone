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

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
