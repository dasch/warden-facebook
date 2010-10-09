module Warden
  module Facebook
    class User < Struct.new(:data, :token)
      %w[email first_name last_name name].each do |attribute|
        define_method(attribute) do
          data[attribute]
        end
      end
    end
  end
end
