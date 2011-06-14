class RefinerycmsRoutesGenerator < Refinery::Generators::EngineInstaller

  source_root File.expand_path('../../../', __FILE__)
  engine_name "refinerycms_routes"

  class_option :page_controller, :type => :boolean, :default => true, :description => "Include a default custom page controller"

  def generate
    super
    copy_file "#{self.class.source_root}/lib/generators/templates/pages_controller.rb", 
              "app/controllers/pages_controller.rb" if options.page_controller?
  end

end
