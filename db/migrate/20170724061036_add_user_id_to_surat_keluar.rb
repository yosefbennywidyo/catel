class AddUserIdToSuratKeluar < ActiveRecord::Migration[5.1]
  def change
    add_column :surat_keluars, :user_id, :integer
  end
end
