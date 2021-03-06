#--
# EAAL by Peter Petermann <PeterPetermann@gmx.net>
# This library is licensed under the terms found in
# the LICENSE file distributed with it
#
# TODO:
#  - more documenation
#  - write tests (i know, i know, i fail badly)
#  - more error handling (im certain i missed a few possibles)
#  - cleanup (you can see that this is my first project in ruby, cant you?)
#
# THANKS:
#  thanks go to all people on irc.coldfront.net, channel #eve-dev
#  special thanks go to lisa (checkout her eve api library, reve,
#  much more mature then mine) for answering my endless questions
#  about ruby stuff (and for one or two snippets i stole from reve)
#++
# Neat little hack to get around path issues on require
$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# External libs
require 'rubygems'
require 'hpricot'
require 'cgi'
require 'faraday'
require 'time'
require 'json'

# And now EAAL stuff
require 'eaal/version'
require 'eaal/cache/base'
require 'eaal/cache/file'
require 'eaal/cache/memcached'
require 'eaal/exception'
require 'eaal/result'
require 'eaal/rowset'

module EAAL
  @@version_string = "EAAL" +  VERSION # the version string, used as client name in http requests

  @@api_base = "https://api.eveonline.com"  # the url used as basis for all requests, you might want to use gatecamper url or a personal proxy instead
  @@crest_base = "https://public-crest.eveonline.com" # the url used as basis for all crest requests
  @@additional_request_parameters = {}       # hash, if :key => value pairs are added those will be added to each request
  @@cache = EAAL::Cache::NoCache.new         # caching object, see EAAL::Cache::FileCache for an Example

  def self.version_string
    @@version_string
  end
  def self.version_string=(val)
    @@version_string = val
  end
  def self.api_base
    @@api_base
  end
  def self.api_base=(val)
    @@api_base = val
  end
  
  def self.crest_base
    @@crest_base
  end
  def self.crest_base=(val)
    @@crest_base = val
  end
  
  def self.additional_request_parameters
    @@additional_request_parameters
  end
  def self.additional_request_parameters=(val)
    @@additional_request_parameters = val
  end
  def self.cache
    @@cache
  end
  def self.cache=(val)
    @@cache = val
  end
end
require 'eaal/api'
require 'eaal/crest'
