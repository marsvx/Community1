class User < ApplicationRecord
    has_one :user
    has_many :dependents, class_name: 'Dependent'
    #this is an array that holds our age ranges
    AGE_RANGES = ['0-18', '19-24', '25-34', '35-70', '70-+']

    #this validation is useful bc it makes sure a user has an appropiate age range before saving the user to the db
    validates :ageRange, presence: true, inclusion: { in: AGE_RANGES }      
end
