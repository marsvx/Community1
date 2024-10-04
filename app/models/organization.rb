class Organization < ApplicationRecord
    has_many : classifications, class_name: 'Classification'
    has_many : categories, class_name: 'Category', through: :classifications
end
