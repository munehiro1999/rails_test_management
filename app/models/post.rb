class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }

  validate :start_end_check

  private

  def start_end_check
    return if start_date.blank? || end_date.blank?

    if start_date > end_date
      errors.add(:end_date, "は開始日より後の日付を指定してください")
    end
  end
end
