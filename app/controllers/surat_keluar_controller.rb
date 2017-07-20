class SuratKeluarController < ApplicationController
  def new
  end
  
  def create
    # See paramaters look like
    render plain: params[:surat_keluar].inspect
  end
end