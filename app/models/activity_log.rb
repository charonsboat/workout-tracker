class ActivityLog < ApplicationRecord
  before_save :nilify_blanks!

  belongs_to :user
  belongs_to :activity

  private

  def nilify_blanks!
    attributes.each do |column, _value|
      self[column] = nil if self[column].blank?
    end
  end
end
