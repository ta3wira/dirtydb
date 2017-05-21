# http://stackoverflow.com/questions/5108876/kill-a-postgresql-session-connection
namespace :db do
  desc "Fix 'database is being accessed by other users' POSTGRES"
  task :terminate => :environment do
    puts "===============Terminate Open connections===================="
    ActiveRecord::Base.connection.execute <<-SQL
    SELECT
    pg_terminate_backend(pid)
    FROM
    pg_stat_activity
    WHERE
    pid <> pg_backend_pid()
    AND datname = '#{ActiveRecord::Base.connection.current_database}';
    SQL
  end

end

if Rails.env.production?

else
  Rake::Task["db:drop"].enhance ["db:terminate"]
end
