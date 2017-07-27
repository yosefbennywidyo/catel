class SuratKeluar < ApplicationRecord
  validates :keterangan, presence: true,
                    length: { minimum: 15 }
  belongs_to :user
  has_attached_file :lampiran
  validates_attachment :lampiran, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
