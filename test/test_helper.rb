# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'test_frameworks'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'update_all_scope'
require 'minitest/autorun'

case ENV['DB']
when 'mysql'
  require 'lib/mysql2_connection'
when 'pg'
  require 'lib/postgresql_connection'
else
  fail 'please run test cases by: `rake test DB=mysql` or `rake test DB=pg`'
end

require 'lib/patches'
require 'lib/seeds'

def in_sandbox
  ActiveRecord::Base.transaction do
    yield
    fail ActiveRecord::Rollback
  end
end

def pg?
  return false if not defined?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  return User.connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
end

def mysql?
  return false if not defined?(ActiveRecord::ConnectionAdapters::Mysql2Adapter)
  return User.connection.is_a?(ActiveRecord::ConnectionAdapters::Mysql2Adapter)
end

def assert_equal_in_dbs(result, expected)
  assert_equal expected[:pg], result if pg?
  assert_equal expected[:mysql], result if mysql?
end

def assert_queries(expected_count, event_key = 'sql.active_record')
  sqls = []
  subscriber = ActiveSupport::Notifications.subscribe(event_key) do |_, _, _, _, payload|
    next if payload[:sql].start_with?('PRAGMA table_info')
    next if payload[:sql] =~ /\A(?:BEGIN TRANSACTION|COMMIT TRANSACTION|BEGIN|COMMIT)\z/i

    sqls << "  ● #{payload[:sql]}"
  end
  yield
  if expected_count != sqls.size # show all sql queries if query count doesn't equal to expected count.
    assert_equal "expect #{expected_count} queries, but have #{sqls.size}", "\n#{sqls.join("\n").tr('"', "'")}\n"
  end
  assert_equal expected_count, sqls.size
ensure
  ActiveSupport::Notifications.unsubscribe(subscriber)
end
