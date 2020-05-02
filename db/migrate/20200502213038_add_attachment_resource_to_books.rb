class AddAttachmentResourceToBooks < ActiveRecord::Migration[6.0]
  def self.up
    change_table :books do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :books, :resource
  end
end
