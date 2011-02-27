class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string   :description
      t.string   :ufile_file_name
      t.string   :ufile_content_type
      t.integer  :ufile_file_size
      t.datetime :ufile_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
