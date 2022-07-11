class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :must_include_these_words

  def must_include_these_words
    if title.present? && title.exclude?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
      errors.add(:title, 'Your title is not clickbait-y')
    end
  end
end
