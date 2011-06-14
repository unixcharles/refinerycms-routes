require 'refinerycms-base'
require 'refinerycms-pages'

module Refinery
  module Routes
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.to_prepare do
        ::ApplicationController.helper(RouterHelper)

        Page.module_eval do
          has_many :routes, :dependent => :destroy
        end
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = 'refinerycms_routes'
          plugin.url = {:controller => '/admin/routes', :action => 'index'}
          plugin.menu_match = /routes/
          plugin.activity = {
            :class => Route,
            :title => 'Url'
          }
        end

      end
    end
  end
end
