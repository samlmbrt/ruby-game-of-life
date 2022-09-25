# frozen_string_literal: true

require 'gosu'
require 'slop'

# Game of Life window
class Window < Gosu::Window
  def initialize(rows:, columns:)
    super rows, columns
    self.caption = 'Game of Life'
  end

  def update
  end

  def draw
  end
end

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
window = Window.new(rows: rows, columns: columns)
window.show
