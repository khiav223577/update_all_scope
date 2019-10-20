# frozen_string_literal: true

require 'test_helper'

class UpdateAllScopeTest < Minitest::Test
  def setup
  end

  def test_that_it_has_a_version_number
    refute_nil ::UpdateAllScope::VERSION
  end

  def test_update_name_with_where_condition
    scope = UpdateAllScope::UpdateAllScope.new(relation: User.where(id: -1))
    scope.update(name: 'wolf')

    if ActiveRecord::VERSION::MAJOR < 4
      assert_equal_in_dbs(
        scope.to_sql,
        pg: %{UPDATE "users" SET "name" = 'wolf' WHERE "users"."id" = -1},
        mysql: %{UPDATE `users` SET `name` = 'wolf' WHERE `users`.`id` = -1}
      )
    else
      assert_equal_in_dbs(
        scope.to_sql,
        pg: %{UPDATE "users" SET "name" = 'wolf' WHERE "users"."id" = -1},
        mysql: %{UPDATE `users` SET `users`.`name` = 'wolf' WHERE `users`.`id` = -1}
      )
    end
  end
end
