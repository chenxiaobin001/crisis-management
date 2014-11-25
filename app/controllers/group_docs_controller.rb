class GroupDocsController < ApplicationController
  before_action :set_group_doc, only: [:show, :edit, :update, :destroy]

  before_filter :check_privileges!
  # GET /group_docs
  # GET /group_docs.json
  def index
    @group_docs = GroupDoc.all
  end

  # GET /group_docs/1
  # GET /group_docs/1.json
  def show
  end

  # GET /group_docs/new
  def new
    @group_doc = GroupDoc.new
  end

  # GET /group_docs/1/edit
  def edit
  end

  # POST /group_docs
  # POST /group_docs.json
  def create
    @group_doc = GroupDoc.new(group_doc_params)

    respond_to do |format|
      if @group_doc.save
        format.html { redirect_to @group_doc, notice: 'Group doc was successfully created.' }
        format.json { render :show, status: :created, location: @group_doc }
      else
        format.html { render :new }
        format.json { render json: @group_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_docs/1
  # PATCH/PUT /group_docs/1.json
  def update
    respond_to do |format|
      if @group_doc.update(group_doc_params)
        format.html { redirect_to @group_doc, notice: 'Group doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_doc }
      else
        format.html { render :edit }
        format.json { render json: @group_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_docs/1
  # DELETE /group_docs/1.json
  def destroy
    @group_doc.destroy
    respond_to do |format|
      format.html { redirect_to group_docs_url, notice: 'Group doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_doc
      @group_doc = GroupDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_doc_params
      params.require(:group_doc).permit(:group_id, :document_id)
    end
end
