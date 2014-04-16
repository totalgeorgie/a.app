# encoding: utf-8
class ResumeUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
  
  def extension_white_list
     %w(doc docx pdf txt jpg png)
  end
end