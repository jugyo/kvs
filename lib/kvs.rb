require 'digest/sha1'
require 'yaml'

module KVS
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

    def inspect
      pairs = Dir.glob(dir + '/*').map {|f|
        "#{File.basename(f).inspect}: #{YAML.load_file(f).inspect}"
      }
      "KVS(#{pairs.join ', '})"
    end
  end
end
