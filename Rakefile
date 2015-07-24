begin
	require 'bundler/gem_tasks'
rescue LoadError
end

require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'bundler/gem_tasks'

require File.dirname(__FILE__) + '/lib/aws/s3'

def library_root
  File.dirname(__FILE__)
end

task :default => :test

Rake::TestTask.new do |test|
  test.pattern = 'test/*_test.rb'
  test.verbose = true
end

desc 'Check code to test ratio'
task :stats do 
  library_files = FileList["#{library_root}/lib/**/*.rb"]
  test_files    = FileList["#{library_root}/test/**/*_test.rb"]
  count_code_lines = Proc.new do |lines| 
    lines.split("\n").inject(0) do |code_lines, line|
      next code_lines if [/^\s*$/, /^\s*#/].any? {|non_code_line| non_code_line === line}
      code_lines + 1
    end
  end
  
  count_code_lines_for_files = Proc.new do |files|
    files.inject(0) {|code_lines, file| code_lines + count_code_lines[IO.read(file)]}
  end
  
  library_code_lines = count_code_lines_for_files[library_files]
  test_code_lines    = count_code_lines_for_files[test_files]
  ratio = Proc.new { sprintf('%.2f', test_code_lines.to_f / library_code_lines)}
  
  puts "Code LOC: #{library_code_lines}    Test LOC: #{test_code_lines}    Code to Test Ratio: 1:#{ratio.call}"
end

namespace :test do
  find_file = lambda do |name|
    file_name = lambda {|path| File.join(path, "#{name}.rb")}
    root = $:.detect do |path|
      File.exist?(file_name[path])
    end
    file_name[root] if root
  end
  
  Rake::TestTask.new(:remote) do |test|
    test.pattern = 'test/remote/*_test.rb'
    test.verbose = true
  end
  
  Rake::TestTask.new(:all) do |test|
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
  
end
