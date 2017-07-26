class SuratKeluarController < ApplicationController

  def index
    @surat_keluar = SuratKeluar.all()
    
    #if current_user.email = "ugel@kemenagsumteng.go.id"
    @surat_keluar_konsep = @surat_keluar.where(status: "konsep")
    @surat_keluar_koreksi_ktu = @surat_keluar.where(status: "koreksi KTU")
    @surat_keluar_konsep_kepala = @surat_keluar.where(status: "konsep Kepala")
    @surat_keluar_koreksi_kepala = @surat_keluar.where(status: "koreksi Kepala")
    @surat_keluar_siap_cetak = @surat_keluar.where(status: "siap cetak")
    #elsif current_user.email = "ktu@kemenagsumteng.go.id"
    @surat_keluar_revisi_ktu = @surat_keluar.where(status: "revisi KTU")
    @surat_keluar_fix_ktu = @surat_keluar.where(status: "fix KTU")
    #else
    @surat_keluar_revisi_kepala = @surat_keluar.where(status: "revisi Kepala")
    @surat_keluar_fix_kepala = @surat_keluar.where(status: "fix Kepala")
    #end
    #@surat_keluar = current_user.surat_keluar
    #@konsep = current_user.surat_keluar.where(status: "konsep")
    #@koreksi_kasie_1 = current_user.surat_keluar.where(status: "koreksi KASIE ke-I")
    #@revisi_kasie_1 = current_user.surat_keluar.where(status: "revisi untuk KASIE ke-I")
    #@koreksi_kasie_2 = current_user.surat_keluar.where(status: "koreksi KASIE ke-II")
    #@revisi_kasie_2 = current_user.surat_keluar.where(status: "revisi untuk KASIE ke-II")
  end
  
  def show
    @surat_keluar = SuratKeluar.find(params[:id])
  end
  
  def new
    @surat_keluar = current_user.surat_keluar.new
  end
  
  def edit
    @surat_keluar = current_user.surat_keluar.find(params[:id])
  end
  
  def create
    # See paramaters look like
    # render plain: params[:surat_keluar].inspect
    
    # Define @surat_keluar as new SuratKeluar
    @surat_keluar = current_user.surat_keluar.new(surat_keluar_params)
    
    # Saving data in the database
    if @surat_keluar.save
      # Redirect the user to the show action
      redirect_to @surat_keluar
    else
      render 'new'
    end
  end
  
  def update
    @surat_keluar = current_user.surat_keluar.find(params[:id])
 
    if @surat_keluar.update(surat_keluar_params)
      redirect_to @surat_keluar
    else
      render 'edit'
    end
  end
  
  def change
    @surat_keluar = SuratKeluar.find(params[:id])
    @surat_keluar.update_attributes(status: params[:status])
      respond_to do |format| 
      format.html { redirect_to surat_keluar_path, notice: "Status updated"}
      
    end
  end  
  
  def destroy
    @surat_keluar = current_user.surat_keluar.find(params[:id])
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