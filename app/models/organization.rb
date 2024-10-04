class Organization < ApplicationRecord
    has_many : classifications, class_name: 'Classification'
end
