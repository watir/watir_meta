require 'rake/clean'
CLEAN << FileList['pkg', '*.gem', 'commonwatir/**/*.gem', 'watir/**/*.gem']

task :default => :build

desc "Build all the Watir gems"
task :build => :clean do
  build_gems
end

desc "Release all the Watir gems"
task :release => :build do
  release_gems
end

def build_gems
  Dir.chdir("commonwatir") { sh "rake build" }
  Dir.chdir("watir") { sh "rake build:all" }

  mkdir_p "pkg" unless File.exist?("pkg")
  gems = Dir['{commonwatir,watir}/**/*.gem']
  gems.each {|gem| FileUtils.cp gem, 'pkg'}
end

def release_gems
  Dir.chdir("commonwatir") { sh "rake release" }
  Dir.chdir("watir") do
    Dir["pkg/*.gem"].each do |gem|
      sh "gem push #{gem}"
    end
  end
end
