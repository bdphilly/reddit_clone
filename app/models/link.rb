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
  validates :title, :url, :submitter_id, presence: true
  validates :url, :format => URI::regexp(%w(http https))
end
