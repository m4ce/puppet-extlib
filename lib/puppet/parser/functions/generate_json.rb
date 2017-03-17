module Puppet::Parser::Functions
  newfunction(:generate_json, :type => :rvalue, :doc => <<-EOS
This generate a JSON body from a Ruby hash.
You can optionally specify the options in a second argument. For instance {"indent" => '  '}.
    EOS
  ) do |args|
    raise(Puppet::ParseError, "generate_json(): Must specify the Hash") if args.size == 0

    var = args[0]
    unless var.is_a?(Hash)
      raise Puppet::ParseError, ("#{var.inspect} is not a Hash. It looks to be a #{var.class}")
    end

    require 'json'
    JSON.pretty_generate(var, args[1] || {})
  end
end
