class Comment < ApplicationRecord
  belongs_to :task
  has_one_attached :ref_file # Using inbuilt ActiveStorage module of rails 5.2 for attachments
end
