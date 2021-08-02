# dr_async
Provides a basic asyncronous method queue for dragonruby. See `app/main.rb` for a demo.  
Pull requests welcome. Please make sure your code passes a basic `rubocop` (within reason).

## Usage
1. Copy the `lib` directory into the root of your project.
2. In `main.rb`, type `require 'lib/async.rb'` in a new line at the top of your file.
3. Call `Async.queue(method: :method_name, arguments: [argument_1, argument_2])` to add the specified method to the `$async_queue`.
4. Call `Async.tick()` to execute the next method in the queue.

## Details
- `Async`'s own methods are required to be namespaced.
- Namespaced methods from other modules are not currenly supported.

# TODO
- Determine way of capturing the return of a method and providing it to the requesting method.
- Support namespaced methods.

# Methods
### queue(method:, arguments: [] )
- Add a method call to the `$async_queue`

Arguments:
- `method`: symbol referencing the method name
- `arguments`: (Optional) array of arguments for `method`

### tick
- Execute the next method in the `$async_queue`, then remove it.

### unqueue(method:, arguments: [] )
- Remove all entries in the `$async_queue` matching the pattern `"[ method, arguments ]"`.


Arguments:
- `method`: symbol referencing the method name
- `arguments`: (Optional) array of arguments for `method`
