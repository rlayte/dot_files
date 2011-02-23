require "rake"

HOME = Etc.getpwuid.dir
CURRENT = File.dirname(__FILE__)

task :directories do
    puts '--- BUILDING PROJECT DIRECTORIES ---'

    mkdir "#{HOME}/work/"
    mkdir "#{HOME}/work/projects"
    mkdir "#{HOME}/work/experiments"
    mkdir "#{HOME}/work/experiments/python"
    mkdir "#{HOME}/work/experiments/ruby"
    mkdir "#{HOME}/work/experiments/scheme"
    mkdir "#{HOME}/work/experiments/javascript"
end

task :install do
    puts '--- COPYING FILES TO HOME DIRECTORY ---'

    Dir['**'].each do |file|
        unless file == '..' or file == '.' or file =~ /swp/ or file =~ /rake/
            sh "ln -s #{CURRENT}/#{file} #{HOME}/.#{file}"
        end
    end
end
