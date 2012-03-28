require 'rake/clean'

CLEAN << FileList['pkg', '*.gem', 'commonwatir/*.gem', 'watir/*.gem']

desc "Generate all the Watir gems"
task :default => :build

task :build => :clean do
  begin
    chdir 'commonwatir'
    sh 'gem build commonwatir.gemspec'
  ensure
    chdir '..'
  end
  begin
    chdir 'watir'
    sh 'gem build watir.gemspec'
  ensure
    chdir '..'
  end
  mkdir_p "pkg" unless File.exist?("pkg")
  gems = Dir['*/*.gem']
  gems.each {|gem| FileUtils.mv gem, 'pkg'}
end


