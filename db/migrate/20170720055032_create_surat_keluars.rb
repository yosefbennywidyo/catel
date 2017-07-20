class CreateSuratKeluars < ActiveRecord::Migration[5.1]
  def change
    create_table :surat_keluars do |t|
      t.text :keterangan
      t.text :lampiran

      t.timestamps
    end
  end
end
