class Reply < ApplicationRecord
  belongs_to :issue
  validates :content, :author, presence: true
end
