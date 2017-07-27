class AddAttachmentLampiranToSuratKeluars < ActiveRecord::Migration[5.1]
  def self.up
    change_table :surat_keluars do |t|
      t.attachment :lampiran
    end
  end

  def self.down
    remove_attachment :surat_keluars, :lampiran
  end
end
