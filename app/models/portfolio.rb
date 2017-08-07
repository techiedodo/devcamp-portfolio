# == Schema Information
#
# Table name: portfolios
#
#  id          :integer          not null, primary key
#  title       :string
#  subtitle    :string
#  body        :text
#  main_image  :text
#  thumb_image :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  def self.theScope
    where(subtitle: 'scope' )
  end
  scope :other_items_portfolio, -> { where(subtitle: 'other')}

  after_initialize :set_defaults

  private
  def set_defaults
    self.thumb_image ||= 'http://via.placeholder.com/350x200'
    self.main_image ||= 'http://via.placeholder.com/600x400'
  end

end
