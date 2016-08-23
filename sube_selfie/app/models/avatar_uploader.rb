class AvatarUploader < CarrierWave::Uploader::Base
  # Remember to create a migration!
  storage :file
end
