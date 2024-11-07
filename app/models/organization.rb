class Organization < ApplicationRecord

    before_save :downcase_email, if: :new_record?

    validates :email, presence: true, uniqueness: { case_sensitive: false }

    has_many :classifications, class_name: 'Classification'
    has_many :categories, class_name: 'Category', through: :classifications
    has_many :events, class_name: 'Event'
    has_many :favorites, class_name: 'Favorite'
    has_many :users, class_name: 'User', through: :favorites
    has_many :reviews, class_name: 'Review'
end
