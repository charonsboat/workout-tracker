class ActivityLog < ApplicationRecord
  before_save :nilify_blanks!

  belongs_to :activity

  private

  def nilify_blanks!
    attributes.each do |column, _value|
      self[column] = nil unless self[column].present?
    end
  end
end
