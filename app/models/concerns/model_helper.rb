module ModelHelper
  extend ActiveSupport::Concern

  def method_missing(name, *args)
    method_without_bang = name.to_s.gsub("!", '')

    if self.respond_to?(method_without_bang)
      send(method_without_bang)
      save!
    else
      raise "Undefined Method #{name}"
    end
  end

  module ClassMethods
    def random
      find(self.pluck(:id).shuffle.first)
    end
  end
end