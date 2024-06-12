class BlogPost < ApplicationRecord
    has_one_attached :cover_image
    has_rich_text :content
end
