class Contact < ApplicationRecord
    mount_uploader :image, PictureUploader

    def self.import_csv(file)
        CSV.foreach(file.path, headers: true) do |row|
          contact_params = row.to_h
          Contact.create(contact_params)
        end
    end
end
