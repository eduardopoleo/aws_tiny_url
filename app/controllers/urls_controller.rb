class UrlsController < ApplicationController
  def show
    url = Url.find_by(slug: params[:slug])

    redirect_to url.original_url
  end
end