require 'bundler/setup'
require 'rake'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'appraisal'

desc "Default: Run all specs and cucumber features under all supported Rails versions."
task :default => ["appraisal:install"] do
  exec('rake appraisal spec cucumber')
end

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
end

Cucumber::Rake::Task.new(:cucumber)

if RUBY_VERSION.to_f == 1.8
  namespace :rcov do
    task :cleanup do
      rm_rf 'coverage.data'
    end

    RSpec::Core::RakeTask.new :spec do |t|
      t.rcov = true
      t.rcov_opts = %[-Ilib -Ispec --exclude "gems/*,features"]
      t.rcov_opts << %[--no-html --aggregate coverage.data]
    end

    Cucumber::Rake::Task.new :cucumber do |t|
      t.cucumber_opts = %w{--format progress}
      t.rcov = true
      t.rcov_opts = %[-Ilib -Ispec --exclude "gems/*,features"]
      t.rcov_opts << %[--text-report --sort coverage --aggregate coverage.data]
    end
  end

  desc "run specs and cukes with rcov"
  task :rcov => ["rcov:cleanup", "rcov:spec", "rcov:cucumber"]
end

desc "Push docs/cukes to relishapp using the relish-client-gem"
task :relish, :version do |t, args|
  raise "rake relish[VERSION]" unless args[:version]
  sh "cp Changelog.md features/"
  sh "relish versions:add bookingsync-ruby:#{args[:version]}"
  sh "relish push BookingSync/bookingsync-ruby:#{args[:version]}"
  sh "rm features/Changelog.md"
end

task :clobber do
  rm_rf 'pkg'
  rm_rf 'tmp'
  rm_rf 'coverage'
  rm 'coverage.data'
end

namespace :clobber do
  desc "remove generated rbc files"
  task :rbc do
    Dir['**/*.rbc'].each {|f| File.delete(f)}
  end
end
