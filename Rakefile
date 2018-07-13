#!/usr/bin/env rake

require 'fileutils'

desc "Limpa todas as revistas da pasta db/revistas"
namespace :db do
	task :clear, [:folder, :file_extension] do |task, args|
		FileUtils.rm Dir["db/#{args.folder}/*.#{args.file_extension}"]
    p args
    p "Apagando a pasta #{args.folder} com extensão #{args.file_extension}..."
  end

	desc "Popula com os dados definidos no arquivo db/folder/seeds.rb"
	task :seed, [:folder] do
		seed_file = File.expand_path "db/#{args.folder}/seeds.rb"
		load(seed_file) if File.exist?(seed_file)
  end

	desc "Popula com os dados definidos no arquivo db/folder/seeds.rb,
				apagando os existentes"
	task :reseed, [:folder] => ["db:clear", "db:seed"] do
	end
end