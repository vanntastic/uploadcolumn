require 'fileutils'
PUBLIC_PATH = File.expand_path(File.join(RAILS_ROOT, "public"))
UC_PATH = File.expand_path(File.join(RAILS_ROOT,"vendor/plugins/upload_column"))

namespace :upload_column do
  
  desc 'install the file icons for use with upload column files'
  task :install_icons do
    image_path = File.join(PUBLIC_PATH, "images", "uc_icons")
    Dir.mkdir image_path
    uc_image_path = Dir.glob(File.join(UC_PATH, "images", "*.gif"))

    FileUtils.cp_r(uc_image_path,image_path)
    puts "Files Icons have been installed to your images directory for upload_column helpers"
  end
  
  desc 'install the css files for using the upload_column helpers'
  task :install_css do
    css_path = File.join(PUBLIC_PATH,"stylesheets","uc_icons")
    Dir.mkdir css_path
    uc_css_path = Dir.glob(File.join(UC_PATH, "stylesheets", "*.css"))
    FileUtils.cp_r(uc_css_path, css_path)
    puts "CSS Files Have been installed for upload_column helpers"
  end
  
  desc 'Install all the files for upload_column helpers'
  task :install_all => [:install_css, :install_icons] do
    puts "==\nAll Files have been installed for use with upload_column helpers\n"
    puts "Add this to your layout file <%= upload_column_styles %>"
  end
  
end
