# frozen_string_literal: true

require 'active_record'
ActiveRecord::Base.establish_connection(
  'adapter'  => 'postgresql',
  'database' => 'travis_ci_test',
)
