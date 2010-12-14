require 'rake'
require 'rspec/core/rake_task'
require 'rake/rdoctask'

desc 'Default: Run all specs'
task :default => :spec

desc "Run all specs for a specific rails version"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

desc 'Generate documentation for the i18n_controller_namespaces plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'I18nControllerNamespaces'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end