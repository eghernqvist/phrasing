CONFIG_FILE = <<-CONFIG
Phrack.setup do |config|
  config.route = 'phrack'
end

# List all the model attributes you wish to edit with Phrack, example:
# Phrack.whitelist = ["Post.title", "Post.description"]
Phrack.whitelist = []
# Phrack.allow_update_on_all_models_and_attributes = true;
CONFIG

MODULE_FILE = <<-MODULE
module PhrackHelper
  # You must implement the can_edit_phrases? method.
  # Example:
  #
  # def can_edit_phrases?
  #  current_user.is_admin?
  # end

  def can_edit_phrases?
    raise NotImplementedError.new("You must implement the can_edit_phrases? method")
  end
end
MODULE

namespace :phrack do
  desc "Install the plugin, including the migration."
  task :install do
    Rake::Task["phrack_rails_engine:install:migrations"].invoke
    Rake::Task["phrack:install_initializer"].invoke
    Rake::Task["phrack:install_phrack_helper"].invoke
  end

  desc "Create the initializer file"
  task :install_initializer do
    filepath = Rails.root.join *%w(config initializers phrack.rb)
    if File.exists?(filepath)
      alert "Phrack config file already exists."
    else
      File.open(filepath, 'w') do |f|
        f << CONFIG_FILE
      end
      notice "created", " config/initializers/phrack.rb"
    end
  end

  desc "Create the PhrackHelper file"
  task :install_phrack_helper do
    filepath = Rails.root.join *%w(app helpers phrack_helper.rb)
    if File.exists?(filepath)
      alert "Phrack helper file already exists."
    else
      File.open(filepath, 'w') do |f|
        f << MODULE_FILE
      end
      notice "created", "app/helpers/phrack_helper.rb"
      notice "Now run 'rake db:migrate'."
    end
  end
end

def notice(colored_text, tailing_text = nil)
  puts "\033[#{32}m#{colored_text}\033[0m #{tailing_text}"
end

def alert(colored_text, tailing_text = nil)
  puts "\033[#{31}m#{colored_text}\033[0m #{tailing_text}"
end
