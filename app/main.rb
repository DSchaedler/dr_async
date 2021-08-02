require 'lib/async.rb'

def tick(args)
  args.outputs.labels << [640, args.grid.top - 20, 'Async Processing Test', 5, 1]

  args.state.labels ||= []
  tick = args.state.tick_count

  if tick == 1
    20.times do
      Async.queue(method: :print, arguments: [args])
    end
  end

  Async.tick

  args.outputs.primitives << args.state.labels

  def print(args)
    tick = args.state.tick_count
    args.state.labels << { x: 640, y: args.grid.top - 30 - tick * 20, text: "Tick: #{tick}", alignment_enum: 1, primitive_type: :label }
  end
end
