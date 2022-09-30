# frozen_string_literal: true

require 'gosu'
require 'slop'

# World state
class World
  attr_accessor :rows, :columns

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
  end

  def tick
    # todosam
  end
end

# Game window
class Window < Gosu::Window
  def initialize(world, cell_size)
    super(world.rows * cell_size, world.columns * cell_size)
    self.caption = 'Game of Life'
    @world = world
  end

  def draw
    @world.tick
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

world = World.new(rows, columns)
window = Window.new(world, size)
window.show

