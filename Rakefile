#!/usr/bin/env rake

task :default => :test

task :ci => [:dump, :test]

desc 'show `vim --version` message'
task :dump do
  sh 'vim --version'
end

desc 'run the vspec test suite'
task :test do
  sh 'bundle exec vim-flavor test'
end
