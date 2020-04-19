require 'pry'

def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty?
  abort("mkdir: only one string title") if ARGV.length > 1
end

def get_folder_name
  check_if_user_gave_input
  return folder_name = ARGV.first
end

def set_gemfile
	gemfile =File.open("Gemfile", "w")
	gemfile.puts("source 'https://rubygems.org'")
	gemfile.puts("ruby '2.5.1'")
	gemfile.puts("gem 'rspec'")
	gemfile.puts("gem 'pry'")
	gemfile.puts("gem 'dotenv'")
	gemfile.close
	system("bundle install")
end

def set_env
	dot_env = File.open(".env", "w")
	dot_env.puts("#enter API KEYS")
	dot_env.puts("Clé 1 = ''")
	dot_env.puts("Clé 2 = ''")
	dot_env.puts("Clé 3 = ''")
	dot_env.puts("Clé 4 = ''")	
	dot_env.close
	dot_gitignore = File.open(".gitignore", "w")
	dot_gitignore.puts(".env")
	dot_gitignore.close
end

def set_ruby_app
	puts "How many files would you like to set?"
	print "> "
	nb_of_files = STDIN.gets.chomp.to_i
	while nb_of_files > 0 do
		puts "What is the file name?"
		print "> "
		file_name = STDIN.gets.chomp
		main_file = file_name + ".rb"
		spec_file = file_name + "_spec.rb"
		Dir.chdir("lib")
		set_lib = File.open(main_file, "w")
		set_lib.puts("require 'pry")
		set_lib.close
		Dir.chdir("..")
		Dir.chdir("spec")
		set_spec = File.open(spec_file, "w")
		set_spec.puts("require_relative '../lib/" + file_name + "'")
		set_spec.close		
		nb_of_files -= 1
	end
end

def set_folders(name)
	Dir.mkdir(name)
	Dir.chdir name
	Dir.mkdir("lib")
	Dir.mkdir("spec")
	system("rspec --init")
	set_gemfile
	system("git init")
	set_env
	read_me = File.open("Readme.md", "w")
	read_me.puts("This is a ruby app.")
	read_me.close
	set_ruby_app
end


set_folders(get_folder_name)


