class SuratKeluar < ApplicationRecord
  validates :keterangan, presence: true,
                    length: { minimum: 15 }
end
