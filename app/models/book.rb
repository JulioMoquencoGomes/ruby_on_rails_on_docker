class Book < ApplicationRecord
    validates :name, presence: true
    validates :author, presence: true, format: { without: /\d/ }
    validates :year, presence: true
end
