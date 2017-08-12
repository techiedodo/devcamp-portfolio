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
  include Placeholder
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  has_many :technologies

  def self.theScope
    where(subtitle: 'scope' )
  end
  scope :other_items_portfolio, -> { where(subtitle: 'other')}

  after_initialize :set_defaults

  private
  def set_defaults
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
  end

end
