class Review < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :participation
end
