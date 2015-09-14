class PagesController < ApplicationController
skip_before_filter :authenticate_user!, only:[:terms, :privacypolicy]

  def info
  end

end
