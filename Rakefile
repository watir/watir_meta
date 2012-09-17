require 'rake/clean'
CLEAN << FileList['pkg', '*.gem', 'commonwatir/*.gem', 'watir/*.gem']

task :default => :build

desc "Build all the Watir gems"
task :build => :clean do
  execute_gem "build"
end

desc "Release all the Watir gems"
task :release => :clean do
  execute_gem "release"
end

def execute_gem command
  Dir.chdir 'commonwatir' do
    sh "rake #{command}"
  end
  Dir.chdir 'watir' do
    sh "rake #{command}"
  end
  mkdir_p "pkg" unless File.exist?("pkg")
  gems = Dir['**/*.gem']
  gems.each {|gem| FileUtils.mv gem, 'pkg'}
end


