
puts ARGV

require 'optparse'

options = { :dry_run => false, :file => $stdin, :report_file_name => nil }

OptionParser.new do |opts|
  opts.banner = "Usage: group.rb [options] owning_organization_id rails_environment"
  opts.on('-d', '--[no-]dry-run', 'Dry run only') { |d| options[:dry_run] = d }
  opts.on('-f', '--file FILE_NAME', 'CSV file containing group assignments') {  }
end.parse!

puts 'END'
