class StubsController < ActionController::Base

  # GET /stubs
  def index
    @stubs = Stub.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stubs }
    end
  end

end
