class Bfile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :datafile
  do_not_validate_attachment_file_type :datafile
end
