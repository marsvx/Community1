class Category < ApplicationRecord
    has_many :classifications, class_name: 'Classification'
    has_many :organizations, class_name: 'Organization', through: :classification
end
