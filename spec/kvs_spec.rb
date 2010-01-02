$:.unshift File.dirname(__FILE__) + '/../lib'
require 'kvs'
require 'tmpdir'
require 'fileutils'

describe KVS do
  before do
    @tmpdir = Dir.tmpdir + '/kvs_test'
    FileUtils.rm_rf(@tmpdir)
    FileUtils.mkdir_p(@tmpdir)
    KVS.dir = @tmpdir
  end

  it 'generates file path' do
    KVS.file_of('foo').should == @tmpdir + '/foo'
  end

  it 'stores data' do
    KVS['foo'] = {:a => 'b', :c => 'd'}
    KVS['foo'].should == {:a => 'b', :c => 'd'}
    File.exists?(KVS.file_of('foo')).should be_true
  end

  it 'should store data with "<<"' do
    key = KVS << {:a => 'b', :c => 'd'}
    KVS[key].should == {:a => 'b', :c => 'd'}
    File.exists?(KVS.file_of(key)).should be_true
  end

  it 'can also use Symbol as key' do
    KVS[:foo] = 'test'
    KVS['foo'].should == 'test'
    KVS['bar'] = 'test test'
    KVS[:bar].should == 'test test'
  end

  describe 'no value exists' do
    it 'should return nil' do
      KVS['x'].should be_nil
    end
  end

  describe 'delete value' do
    it 'should delete value' do
      KVS['foo'] = 'bar'
      KVS['foo'].should == 'bar'
      KVS.delete('foo')
      KVS['foo'].should be_nil
      File.exists?(KVS.file_of('foo')).should be_false
    end

    it 'should return nil' do
      KVS['foo'] = 'bar'
      KVS.delete('foo').should be_nil
      KVS.delete('foo').should be_nil
    end
  end

  describe 'should always return nil' do
    it 'should not raise ArgumentError' do
      lambda { KVS['foo'] }.should_not raise_error(ArgumentError)
      lambda { KVS['_'] }.should_not raise_error(ArgumentError)
      lambda { KVS['1'] }.should_not raise_error(ArgumentError)
    end
  end

  describe 'use invalid key' do
    it 'raises ArgumentError' do
      lambda { KVS['.'] }.should raise_error(ArgumentError)
      lambda { KVS['../'] }.should raise_error(ArgumentError)
      lambda { KVS['/'] }.should raise_error(ArgumentError)
    end
  end

  describe 'dir is nil' do
    before do
      KVS.dir = nil
    end

    it 'raises ArgumentError' do
      lambda { KVS['foo'] = {:a => 'b'} }.should raise_error(RuntimeError)
      lambda { KVS['foo'] }.should raise_error(RuntimeError)
    end
  end
end

describe 'KVS#inspect' do
  before do
    @tmpdir = Dir.tmpdir + '/kvs_test'
    FileUtils.rm_rf(@tmpdir)
    FileUtils.mkdir_p(@tmpdir)
    KVS.dir = @tmpdir
  end

  it 'shows the pairs of key and value' do
    KVS.inspect.should == 'KVS()'

    KVS['foo'] = 'bar'
    KVS.inspect.should == 'KVS("foo": "bar")'
  end
end
