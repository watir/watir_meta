require 'rake/clean'
CLEAN << FileList['pkg', '*.gem', 'commonwatir/*.gem', 'watir/*.gem']

task :default => :build

desc "Build all the Watir gems"
task :build => :clean do
  execute_gem "build"
end

desc "Release all the Watir gems"
task :release => :clean do
  execute_gem "push"
end

def execute_gem command
  Dir.chdir 'commonwatir' do
    if command == "push"
	  # make sure that everything is ready for the release
	  # and that git tags will be pushed to the origin.
	  sh "rake release"
	else
      sh "gem #{command} commonwatir.gemspec"
	end
  end
  Dir.chdir 'watir' do
    # can't use rake release here since tags are already pushed
	# and Bundler will barf on that.
    sh "gem #{command} watir.gemspec"
  end
  mkdir_p "pkg" unless File.exist?("pkg")
  gems = Dir['**/*.gem']
  gems.each {|gem| FileUtils.mv gem, 'pkg'}
end


