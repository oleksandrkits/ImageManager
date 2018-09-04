require 'net/http'
require 'json'

class ImagesController < ApplicationController
  before_action :set_image, only: [:destroy]

  def index
    faker = Faker::LoremFlickr.image
    first_part = faker.slice"http://loremflickr.com"
    second_part = get_response_with_redirect(URI.parse(faker))
    @url = first_part + second_part

    @images = Image.all

  end

  def new
    @image = Image.new(url: params[:url])
  end

  def create
    @user = Image.new(image_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to images_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_response_with_redirect(uri)
    r = Net::HTTP.get_response(uri)
    if r.code == "301"
      r = Net::HTTP.get_response(URI.parse(r.header['location']))
      part_url = r.header['location']
    end
    part_url
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:url)
  end

end