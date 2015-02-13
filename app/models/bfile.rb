class Bfile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :datafile,
    :path => ":rails_root/private/:class/:attachment/:hash/:style.:extension",
    :content_type => "application/octet-stream"

  do_not_validate_attachment_file_type :datafile
end
