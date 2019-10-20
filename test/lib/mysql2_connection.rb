# frozen_string_literal: true

require 'active_record'
require 'active_record/connection_adapters/mysql2_adapter'

class ActiveRecord::ConnectionAdapters::Mysql2Adapter
  NATIVE_DATABASE_TYPES[:primary_key] = 'int(11) auto_increment PRIMARY KEY'
end

ActiveRecord::Base.establish_connection(
  'adapter'  => 'mysql2',
  'database' => 'travis_ci_test',
  'username' => 'root',
)