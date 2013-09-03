require_relative 'html_generator'

if ARGV.empty?
		puts "Usage: ruby router.rb [action]"
else
	action = ARGV[0]
	generator = HtmlGenerator.new

	if action == "index"
		generator.index
	elsif action == "show"
		if ARGV[1]
			generator.show(ARGV[1])
		else
			puts "Please pass a parameter"
		end
	else
		puts "Unknown action #{action}.  Use index or show."
	end
end