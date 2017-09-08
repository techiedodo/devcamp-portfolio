class PortfoliosController < ApplicationController
  layout 'portfolio'
  def index
    @portfolio_items = Portfolio.all
  end

  def misc
    @scope_portfolio_items = Portfolio.theScope
  end

  def other
    @other_portfolio_items = Portfolio.other_items_portfolio
  end

  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(item_params)
        format.html { redirect_to portfolios_path, notice: 'The portfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully removed.' }
    end
  end

  private
    def item_params
      params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
    end
end
