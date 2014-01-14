class CertificateUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small do
    process resize_to_fit: [300, 300]
  end
  
  version :medium do
    process resize_to_fit: [600, 600]
  end

  version :large do
    process resize_to_fit: [900, 900]
  end

  def extension_white_list
    %w(jpg jpeg)
  end
  
  def filename
    "certificate.jpg"
  end
end
