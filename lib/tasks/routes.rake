namespace :refinery do
  
  namespace :routes do
    
    desc "List custom routes"
    task :list => :environment do
      Route.order(:locale).all.each do |route|
        route_type = route.redirect? ? 'Redirection' : 'Map'
        puts %(GET | /#{route.url}    {#{route_type} => #{route.target.class} id: #{route.target.id} #{' locale: ' + route.locale unless route.redirect?}})
      end
    end
  
  end
  
end