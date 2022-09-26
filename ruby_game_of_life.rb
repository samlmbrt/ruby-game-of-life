# frozen_string_literal: true

require 'gosu'
require 'slop'

# Game of Life window
class Window < Gosu::Window
  def initialize(rows:, columns:)
    super(rows, columns)
    self.caption = 'Game of Life'
  end

  def draw
    # draw_rect(@x, 10, 5, 5, Gosu::Color.argb(0xff_808080))
  end
end

def parse_arguments
  Slop.parse(suppress_errors: true) do |o|
    o.int('-r', '--rows', 'Number of rows', default: 100)
    o.int('-c', '--columns', 'Number of columns', default: 100)
    o.int('-s', '--size', 'Cell size in pixels', default: 5)
    o.separator('other options:')
    o.on('-h', '--help', 'Show this message') do
      puts(o)
      exit
    end
  end
end

options = parse_arguments
rows, columns, size = options.to_hash.values_at(:rows, :columns, :size)
window = Window.new(rows: rows * size, columns: columns * size)
window.show
