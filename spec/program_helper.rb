require 'spec_helper'

Dir[File.expand_path('../..',__FILE__) + "/lib/*.rb"].each {|f| require f }

require 'stringio'

def capture(stream)
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    yield
    result = eval("$#{stream}").string
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end

  result
end
