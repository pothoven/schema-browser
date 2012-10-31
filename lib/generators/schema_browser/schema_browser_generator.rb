class SchemaBrowserGenerator < Rails::Generators::Base
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def generate_schema_browser
    images = ["back.gif",
              "bar_bottom.png",
              "bar_corner.png",
              "bar_left.png",
              "table_bottom.png",
              "table_corner.png",
              "table_right.png",
              "throbber.gif"]
    directory_name = "vendor/assets/images/schema_browser"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    images.each do |img|
      copy_file "assets/images/#{img}", "#{directory_name}/#{img}"
    end

    javascripts = ["config",
                   "oz",
                   "wwwsqldesigner"]

    directory_name = "vendor/assets/javascripts/schema_browser"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    javascripts.each do |js|
      copy_file "assets/javascripts/#{js}.js", "#{directory_name}/#{js}.js"
    end

    stylesheets = ["doc",
                   "ie6",
                   "ie7",
                   "print",
                   "style"]

    directory_name = "vendor/assets/stylesheets/schema_browser"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    stylesheets.each do |css|
      copy_file "assets/stylesheets/#{css}.css", "#{directory_name}/#{css}.css"
    end

    directory_name = "public/xml"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    directory_name = "public/xml/schema_browser"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    locales = ["en"]
    directory_name = "public/xml/schema_browser/locales"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)

    locales.each do |locale|
      copy_file "assets/xml/locales/#{locale}.xml", "#{directory_name}/#{locale}.xml"
    end

    dbs = ["mysql", "sqlite"]
    directory_name = "public/xml/schema_browser/dbs"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
    dbs.each do |db|
      Dir.mkdir("#{directory_name}/#{db}") unless File.exists?("#{directory_name}/#{db}")
      copy_file "assets/xml/dbs/#{db}/datatypes.xml", "#{directory_name}/#{db}/datatypes.xml"
      copy_file "assets/xml/dbs/#{db}/output.xsl", "#{directory_name}/#{db}/output.xsl"
    end

    directory_name = "app/controllers"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
    copy_file "app/controllers/schema_browser_controller.rb", "#{directory_name}/schema_browser_controller.rb"

    directory_name = "app/views/schema_browser"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
    copy_file "app/views/schema_browser/index.html.erb", "#{directory_name}/index.html.erb"
    copy_file "app/views/schema_browser/schema.xml.builder", "#{directory_name}/schema.xml.builder"

    directory_name = "app/views/layouts"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
    copy_file "app/views/layouts/schema_browser.html.erb", "#{directory_name}/schema_browser.html.erb"

  end

end
