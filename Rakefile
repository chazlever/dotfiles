require 'rake'
require 'erb'

desc "Install dot files into user's home directory."
task :install do
  # Get mappings for ERB files and store in hash
  $cfg_mappings = {}
  mf = 'erb/config.mappings'
  if File.exist?(mf)
    File.open(mf, 'r') do |file|
      while(line = file.gets)
        arr = split(",")
        if arr.size == 2
          $cfg_mappings[arr[0].strip] = arr[1].strip
        end
      end
    end
  end
  
  # Link files to user home directory
  replace_all = link_dir('.', false)
  link_dir('erb', replace_all)
end

def link_dir(dir, replace_all = false)
  prev = Dir.pwd
  Dir.chdir(dir)
  Dir['*'].each do |file|
    next if %w[Rakefile README.md erb config.mappings].include? file
 
    ofile = ".#{file.sub('.erb', '')}"
    if $cfg_mappings.key?(file)
      ofile = $cfg_mappings[file]
    end   
    if File.exist?(File.join(ENV['HOME'], "#{ofile}"))
      if File.identical? file, File.join(ENV['HOME'], "#{ofile}")
        puts "identical ~/#{ofile}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/#{ofile}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/#{ofile}"
        end
      end
    else
      link_file(file)
    end
  end

  Dir.chdir(prev)
  return replace_all
end

def replace_file(file)
  if $cfg_mappings.key?(file)
    system %Q{rm -rf "#{$cfg_mappings[file]}"}
  else
    system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  end
  link_file(file)
end

def link_file(file)
  ofile = file
  if $cfg_mappings.key?(file)
    ofile = $cfg_mappings[file]
    system %Q{mkdir -p "#{File.dirname(ofile)}"}
  end
  if file =~ /.erb$/
    puts "generating ~/#{ofile.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{ofile.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{ofile}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{ofile}"}
  end
end

