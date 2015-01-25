class DocumentsController < ApplicationController
  def show
    @doc = Document.find(params[:id])
    send_file @doc.document.path,
              :filename => @doc.title.parameterize + Rack::Mime::MIME_TYPES.invert[@doc.document_content_type],
              :type => @doc.document_content_type,
              :disposition => 'attachment'
    @doc.punch(request)
  end

  def index
    @docs = Document.all.order(created_at: :desc).page params[:page]
  end
end
