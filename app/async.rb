# Queue tasks for seperated calculation
module Async

  def queue(method:, arguments: [])
    $async_queue ||= []
    $async_queue << [method, arguments]
  end

  def tick
    $async_queue ||= []
    $async_queue.compact
    return if $async_queue.empty?
    send($async_queue[0][0], *$async_queue[0][1])
    $async_queue.shift
  end

  def unquue(method:, arguments: [])
    $async_queue ||= []
    $async_queue.delete([method, arguments])
  end
end

Async.extend Async
