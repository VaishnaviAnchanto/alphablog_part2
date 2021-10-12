class Comment < ApplicationRecord
    belongs_to :bloggers
    belongs_to :articles
end