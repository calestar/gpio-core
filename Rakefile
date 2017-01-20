require "bundler/gem_tasks"
require "rake/testtask"
require 'rubocop/rake_task'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Run RuboCop on the library files'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  task.fail_on_error = true
end

desc 'Run RuboCop on the test files'
RuboCop::RakeTask.new(:'rubocop-test') do |task|
  task.patterns = ['test/**/*.rb']
  task.options = [
    '--display-cop-names',
    '--except',
      'Metrics/AbcSize,Metrics/MethodLength'
  ]
  task.fail_on_error = true
end

task :'rubocop-all' => [:rubocop, :'rubocop-test']
task :default => [:test, :rubocop]
