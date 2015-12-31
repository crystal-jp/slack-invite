require 'rye'

task :default => [ :clean, :install, :build ]

task :install do
  sh 'crystal deps'
end

task :build do
  sh 'mkdir -p bin'
  sh 'crystal build src/app.cr -o ./bin/slack-invite --release'
end

task :spec do
  sh 'crystal spec'
end

task :clean do
 rm_rf '.crystal'
 rm_rf '.deps'
 rm_rf '.shards'
 rm_rf 'libs'
 rm_rf 'bin'
end

task :deploy do
  rbox = Rye::Box.new('pine.moe', :user => 'ec2-user')

  rbox.cd %w[slack-invite]
  rbox.git %w[reset --hard origin/master]
  rbox.git %w[pull origin master]

  rbox.cd %w[../slack-invite.local]
  rbox.disable_safe_mode
  rbox.execute 'bash ./build'
  rbox.execute 'bash ./stop'
  rbox.execute 'bash ./start'
end
