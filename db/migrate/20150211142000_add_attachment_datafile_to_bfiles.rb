class AddAttachmentDatafileToBfiles < ActiveRecord::Migration
  def self.up
    change_table :bfiles do |t|
      t.attachment :datafile
    end
  end

  def self.down
    remove_attachment :bfiles, :datafile
  end
end
