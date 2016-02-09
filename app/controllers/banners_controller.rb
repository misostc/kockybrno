class BannersController < ApplicationController
  def random
    @banner = Banner.order("RANDOM()").first
    render layout: false
  end
end
