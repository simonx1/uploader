class Upload < ActiveRecord::Base
#  after_update :store_title

  has_attached_file :ufile, :styles => {}

  validates_attachment_presence :ufile
  validates_attachment_size :ufile, :less_than => 100.megabytes
  validates_attachment_content_type :ufile, :content_type => [ 'audio/basic', 'audio/mp4', 'audio/mpg', 'audio/mpeg', 'audio/vnd.wave' ]

end
