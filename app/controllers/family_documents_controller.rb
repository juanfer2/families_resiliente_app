class FamilyDocumentsController < ApplicationController
  before_action :set_family_document, only: %i[ show edit update destroy ]

  # GET /family_documents or /family_documents.json
  def index
    @family_documents = FamilyDocument.all
  end

  # GET /family_documents/1 or /family_documents/1.json
  def show
  end

  # GET /family_documents/new
  def new
    @family_document = FamilyDocument.new
  end

  # GET /family_documents/1/edit
  def edit
  end

  # POST /family_documents or /family_documents.json
  def create
    @family_document = FamilyDocument.new(family_document_params)

    respond_to do |format|
      if @family_document.save
        format.html { redirect_to @family_document, notice: "Family document was successfully created." }
        format.json { render :show, status: :created, location: @family_document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @family_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_documents/1 or /family_documents/1.json
  def update
    respond_to do |format|
      if @family_document.update(family_document_params)
        format.html { redirect_to @family_document, notice: "Family document was successfully updated." }
        format.json { render :show, status: :ok, location: @family_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_documents/1 or /family_documents/1.json
  def destroy
    @family_document.destroy
    respond_to do |format|
      format.html { redirect_to family_documents_url, notice: "Family document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_document
      @family_document = FamilyDocument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def family_document_params
      params.require(:family_document).permit(:professional_id, :code)
    end
end
