class Album < ApplicationRecord
    validates :title, presence: true
    validates :band, presence: true
end
