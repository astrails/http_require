# http_require

## Idea

The idea is very simple:
test.rb:
    # this will download bar.rb and eval its content.
    require "http://foo.com/bar.rb"

If a remote file (or one of its local dependencies) requires something that
can't be found locally, it will try to find it remotely from the same location
as the parent.

## Example

http://example.com/test/foo.rb:
    # this will load "http://example.com/test/foo/bar.rb"
    # if "foo/bar" is not available locally
    require "foo/bar"

## Homepage

You can find the latest sources on [github]:(http://github.com/astrails/http_require)

## Installation

    sudo gem install astrails-http_require --source http://gems.github.com/

## Copyright

Copyright (c) 2009 Vitaly Kushner. See LICENSE for details.
