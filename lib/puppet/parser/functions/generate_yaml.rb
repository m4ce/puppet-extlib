module Puppet::Parser::Functions
  newfunction(:generate_yaml, :type => :rvalue, :doc => <<-EOS
This generate a YAML body from a Ruby hash.
    EOS
  ) do |args|
    raise(Puppet::ParseError, "generate_yaml(): Must specify the Hash") if args.size == 0

    var = args[0]
    unless var.is_a?(Hash)
      raise Puppet::ParseError, ("#{var.inspect} is not a Hash. It looks to be a #{var.class}")
    end

    var.to_yaml
  end
end
