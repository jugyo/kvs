**This project has been moved to [http://github.com/jugyo/ykk](http://github.com/jugyo/ykk).**

- - - -

KVS
========

[http://github.com/jugyo/kvs](http://github.com/jugyo/kvs)

Description
--------

KVS is a simple key value store.

Install
--------

    gem install kvs

Usage
--------

use as singleton:

    KVS.dir = '/tmp/kvs'

    KVS['foo'] = 'bar'
    puts KVS['foo'] #=> bar

    key = KVS << 'jugyo'
    puts KVS[key] #=> jugyo

    KVS.delete('foo')

use as instance:

    KVS_A = KVS.new('/tmp/kvs_a')
    KVS_A['foo'] = 'bar'
    puts KVS_A['foo'] #=> bar

License
--------

(The MIT License)

Copyright (c) 2008-2009 jugyo

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
