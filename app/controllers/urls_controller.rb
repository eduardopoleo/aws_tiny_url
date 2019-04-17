require 'digest'

class UrlsController < ApplicationController
  def show
    url = Url.find_by(slug: params[:slug])

    redirect_to url.original_url
  end

  def create
    respond_to do |format|
      format.json {
        Url.create(url_params)
      }
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url).merge(slug)
  end

  def slug
    { slug: Digest::SHA256.hexdigest(params[:original_url])[0..6] }
  end
end