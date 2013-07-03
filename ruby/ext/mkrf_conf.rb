require 'rubygems/command.rb'
require 'rubygems/dependency_installer.rb' 
begin
  Gem::Command.build_args = ARGV
  rescue NoMethodError
end 
inst = Gem::DependencyInstaller.new
begin
  if RUBY_PLATFORM =~ /linux/i
    inst.install "posix_mq", "~> 2.0.0"
  end
  rescue
    exit(1)
end 

f = File.open(File.join(File.dirname(__FILE__), "Rakefile"), "w")   # create dummy rakefile to indicate success
f.write("task :default\n")
f.close
