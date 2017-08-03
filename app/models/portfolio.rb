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
  before_validation :add_placeholder_image_if_blank

  private
  def add_placeholder_image_if_blank
    self.thumb_image = 'http://via.placeholder.com/350x200' if self.thumb_image.blank?
    self.main_image = 'http://via.placeholder.com/600x400' if self.main_image.blank?
  end
end
