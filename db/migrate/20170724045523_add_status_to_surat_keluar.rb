class AddStatusToSuratKeluar < ActiveRecord::Migration[5.1]
  def change
    add_column :surat_keluars, :status, :string, default: "konsep"
  end
end
