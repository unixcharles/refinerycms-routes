class PagesController < ApplicationController

  # This action is usually accessed with the root path, normally '/'
  def home
    error_404 unless (@page = Page.where(:link_url => '/').first).present?
  end

  # This is where the custom routing happen.
  def show
    # Try to find a routes that match with the request path
    if route = Route.where(:url => "#{params[:path]}").first
      route_target = route.target
      case route_target
      when Page then
        # If the target of the route is a page, render that page.
        @page = route.target
        Globalize.locale = route.locale
      when Route
        # If the target of the route is another route, redirect to that page.
        url = URI.parse(request.url)
        url.path = '/' + route.target.url
        redirect_to url.to_s, :status => :moved_permanently and return
      end
    end

    # Fallback to refinerycms default if no routes is found.
    @page ||= Page.find("#{params[:path]}/#{params[:id]}".split('/').last)

    # proceed as usual...
    if @page.try(:live?) || (refinery_user? && current_user.authorized_plugins.include?("refinery_pages"))
      # if the admin wants this to be a "placeholder" page which goes to its first child, go to that instead.
      if @page.skip_to_first_child && (first_live_child = @page.children.order('lft ASC').live.first).present?
        redirect_to first_live_child.url
      elsif @page.link_url.present?
        redirect_to @page.link_url and return
      end
    else
      error_404
    end
  end

end
