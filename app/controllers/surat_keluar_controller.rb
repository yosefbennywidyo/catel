class SuratKeluarController < ApplicationController
  def index
    @surat_keluar = SuratKeluar.all
  end
  
  def show
    @surat_keluar = SuratKeluar.find(params[:id])
  end
  
  def new
    @surat_keluar = SuratKeluar.new
  end
  
  def edit
    @surat_keluar = SuratKeluar.find(params[:id])
  end
  
  def create
    # See paramaters look like
    # render plain: params[:surat_keluar].inspect
    
    # Define @surat_keluar as new SuratKeluar
    @surat_keluar = SuratKeluar.new(surat_keluar_params)
    
    # Saving data in the database
    if @surat_keluar.save
      # Redirect the user to the show action
      redirect_to @surat_keluar
    else
      render 'new'
    end
  end
  
  # the method is made private to make sure it can't be called outside its intended context
  # Factored out into its own method so it can be reused by multiple actions in the same controller
  private
  def surat_keluar_params
    params.require(:surat_keluar).permit(:keterangan, :lampiran)
  end
end