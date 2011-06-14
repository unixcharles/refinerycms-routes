User.all.each do |user|
  if user.plugins.where(:name => 'refinerycms_routes').blank?
    user.plugins.create(:name => 'refinerycms_routes',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

def url_for(options = {})
  url = case options
  when String
    options.gsub('/', '')
  when Hash
    options = options[:path].join('/')
  end
  url
end

Page.all.each do |page|
  page.translations.map(&:locale).each do |locale|
    page_url = url_for(page.url)

    unless locale == ::Refinery::I18n.default_frontend_locale
      page_url = "#{locale}#{ '/' unless page_url.blank? }#{page_url}"
    end

    Route.create(:url => page_url, :locale => locale, :target => page)
  end
end