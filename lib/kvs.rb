require 'digest/sha1'
require 'yaml'

class KVS
  @instance = self.new

  def self.method_missing(method, *args, &block)
    if @instance.respond_to?(method)
      @instance.__send__(method, *args, &block)
    else
      super
    end
  end

  attr_accessor :dir

  def initialize(dir = nil)
    @dir = dir
  end

  def <<(value)
    key = key_gen(value)
    self[key] = value
    key
  end

  def [](key)
    path = file_of(key)
    return nil unless File.exists?(path)
    YAML.load(File.read(path))
  end

  def []=(key, value)
    File.open(file_of(key), 'wb') { |f| f << value.to_yaml }
  end

  def delete(key)
    path = file_of(key)
    File.delete(path) if File.exists?(path)
    nil
  end

  def file_of(key)
    key = key.to_s
    raise ArgumentError, 'invalid key' unless key =~ /^[\w]+$/
    raise "dir is not specified" unless dir
    File.join(dir, key)
  end

  def key_gen(value)
    Digest::SHA1.hexdigest(value.to_s)
  end
end
