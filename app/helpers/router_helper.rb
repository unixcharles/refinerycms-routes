module RouterHelper
  def custom_url_for(page, locale = nil)
    locale ||= Globalize.locale

    if route = Route.where(:target_id => page.id, :target_type => 'Page', :locale => locale).first
      "/#{route.url}"
    else
      page.url
    end
  end
end