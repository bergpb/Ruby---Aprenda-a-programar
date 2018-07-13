# lib/tasks/db.rake
require 'fileutils'

namespace :db do
  desc "Limpa todas os arquivos de uma midia"
  # recebe o argumento folder no comando rake tasks db:clear:folder
  task :clear, [:folder] do |task, args|
    FileUtils.rm Dir["db/#{args.folder}/*.yml"]
  end
end