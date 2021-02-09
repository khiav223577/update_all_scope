# frozen_string_literal: true

require 'active_record'
ActiveRecord::Base.establish_connection(
  'adapter'  => 'postgresql',
  'database' => 'github_actions_test',
  'username' => 'developer',
  'password' => 'developer_password',
  'host'     => 'localhost',
  'port'     => 5432,
)
