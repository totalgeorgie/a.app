# encoding: utf-8
class ResumeUploader < CarrierWave::Uploader::Base
  storage :fog
   
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
     %w(doc docx pdf txt jpg png)
  end
end