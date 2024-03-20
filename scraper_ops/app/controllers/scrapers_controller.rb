# app/controllers/scrapers_controller.rb
class ScrapersController < ApplicationController
  def index
    @scrapers = Scraper.all
    render json: @scrapers
  end

  def show
    @scraper = Scraper.find(params[:id])
    render json: @scraper
  end

  def create
    url = params[:url]

    @scraper = Scraper.new(url: url)

    if @scraper.save
      render json: { message: 'Scraper created successfully.', scraper: @scraper }, status: :created
    else
      render json: { errors: @scraper.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
