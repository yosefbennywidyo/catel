class SuratKeluarController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @surat_keluar = current_user.SuratKeluar
    @konsep = current_user.SuratKeluar.where(status: "Konsep")
    @koreksi_kasie_1 = current_user.SuratKeluar.where(status: "Koreksi dari KASIE ke-I")
    @revisi_kasie_1 = current_user.SuratKeluar.where(status: "Revisi untuk KASIE ke-I")
    @koreksi_kasie_2 = current_user.SuratKeluar.where(status: "Koreksi dari KASIE ke-II")
    @revisi_kasie_2 = current_user.SuratKeluar.where(status: "Revisi untuk KASIE ke-II")
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
    @surat_keluar = current_user.SuratKeluar.new(surat_keluar_params)
    
    # Saving data in the database
    if @surat_keluar.save
      # Redirect the user to the show action
      redirect_to @surat_keluar
    else
      render 'new'
    end
  end
  
  def update
    @surat_keluar = SuratKeluar.find(params[:id])
 
    if @surat_keluar.update(surat_keluar_params)
      redirect_to @surat_keluar
    else
      render 'edit'
    end
  end
  
  def destroy
    @surat_keluar = SuratKeluar.find(params[:id])
    @surat_keluar.destroy
 
    redirect_to surat_keluar_index_url
  end
  
  # the method is made private to make sure it can't be called outside its intended context
  # Factored out into its own method so it can be reused by multiple actions in the same controller
  private
  def surat_keluar_params
    params.require(:surat_keluar).permit(:keterangan, :lampiran, :status)
  end
end