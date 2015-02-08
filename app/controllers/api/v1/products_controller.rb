class Api::V1::ProductsController < Api::V1::BaseController
  respond_to :json, :xml
  
  def index
    @fake_products = FakeProduct.fake(params[:count].to_i)
    respond_with(@fake_products)
  end

end