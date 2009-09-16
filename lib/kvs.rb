require 'digest/sha1'

module KVS
  VERSION = '0.2.1'

  class <<self
    attr_accessor :dir

    def <<(value)
      key = key_gen(value)
      self[key] = value
      key
    end

    def [](key)
      path = file_of(key)
      return nil unless File.exists?(path)
      File.read(path)
    end

    def []=(key, value)
      File.open(file_of(key), 'wb') { |f| f << value.to_s }
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
end
