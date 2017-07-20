class SuratKeluarController < ApplicationController
  def new
  end
  
  def create
    # See paramaters look like
    # render plain: params[:surat_keluar].inspect
    
    # Define @surat_keluar as new SuratKeluar
    @surat_keluar = SuratKeluar.new(params.require(:surat_keluar).permit(:keterangan, :lampiran))
    
    # Saving data in the database
    @surat_keluar.save
    
    # Redirect the user to the show action
    redirect_to @surat_keluar
  end
end