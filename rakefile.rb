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

    overwrite_all = false

    Dir['**'].each do |file|
        unless file == '..' or file == '.' or file =~ /swp/ or file =~ /rake/
            if overwrite_all
                replace_file(file)
            elsif File.exists? "#{HOME}/.#{file}"
                puts "overwrite #{HOME}/.#{file}?"
                print "[a,y,n,q] "

                case $stdin.gets.chomp
                when 'a'
                    overwrite_all = true
                    replace_file(file)
                when 'y'
                    replace_file(file)
                when 'n'
                    puts "skipping #{file}"
                when 'q'
                    exit
                end
            else
                sh "ln -s #{CURRENT}/#{file} #{HOME}/.#{file}"
            end
        end
    end
end

def replace_file(file)
    sh "rm -rf #{HOME}/.#{file}"
    sh "ln -s #{CURRENT}/#{file} #{HOME}/.#{file}"
end
