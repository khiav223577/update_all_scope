# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'update_all_scope/version'

Gem::Specification.new do |spec|
  spec.name          = 'update_all_scope'
  spec.version       = UpdateAllScope::VERSION
  spec.authors       = ['khiav reoy']
  spec.email         = ['khiav223577@gmail.com']

  spec.summary       = 'A Ruby Gem for you to write update queries.'
  spec.description   = 'A Ruby Gem for you to write update queries.'
  spec.homepage      = 'https://github.com/khiav223577/update_all_scope'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject{|f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}){|f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata      = {
    'homepage_uri'      => 'https://github.com/khiav223577/update_all_scope',
    'changelog_uri'     => 'https://github.com/khiav223577/update_all_scope/blob/master/CHANGELOG.md',
    'source_code_uri'   => 'https://github.com/khiav223577/update_all_scope',
    'documentation_uri' => 'https://www.rubydoc.info/gems/update_all_scope',
    'bug_tracker_uri'   => 'https://github.com/khiav223577/update_all_scope/issues',
  }

  spec.add_development_dependency 'bundler', '>= 1.17', '< 3.x'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'mysql2', '>= 0.3'
  spec.add_development_dependency 'pg', '~> 0.18'

  spec.add_dependency 'activerecord', '>= 3'
end
