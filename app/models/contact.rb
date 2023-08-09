class Contact < ApplicationRecord
    mount_uploader :image, PictureUploader
end
