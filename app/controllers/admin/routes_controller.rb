module Admin
  class RoutesController < Admin::BaseController
    before_filter :find_all_locales
    before_filter :find_locale
    before_filter :find_routes_to_redirect, :except => [:index, :redirections]
    before_filter :find_all_pages, :except => [:index, :redirections]

    crudify :route, :sortable => false,
            :title_attribute => 'url', :xhr_paging => true, :include => [:target]


    def redirections
      @routes = Route.where(:redirect => true)
      render :index
    end

    def find_all_locales
      @locales ||= ::Refinery::I18n.frontend_locales
    end

    def find_all_pages
      @pages = Page.all
    end

    def find_all_routes
      @routes = Route.where(:locale => @current_locale).order(:url)
    end

    def find_routes_to_redirect
      @routes = Route.where(:redirect => [false, nil])
    end

    def default_locale
      ::Refinery::I18n.default_frontend_locale
    end

    protected

    def find_locale
      @current_locale ||= (params[:route_locale] || default_locale).to_sym
    end
  end
end
