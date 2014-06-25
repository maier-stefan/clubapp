class SitesController < ApplicationController
  respond_to :html, :js
  before_filter :mobile_redirect, if: :ensure_mobile?

  def start
    respond_with layout: render_layout?
  end


  private
  def mobile_redirect_path
    {
      start: -> { root_path }
     }
  end


end
