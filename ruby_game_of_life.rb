# frozen_string_literal: true

require 'slop'

def parse_arguments
  Slop.parse(suppress_errors: true) do |o|
    o.int('-r', '--rows', 'Number of rows', default: 800)
    o.int('-c', '--columns', 'Number of columns', default: 800)
    o.separator('')
    o.separator('other options:')
    o.on('-h', '--help', 'Show this message') do
      puts o
      exit
    end
  end
end

options = parse_arguments
rows, columns = options.to_hash.values_at(:rows, :columns)

