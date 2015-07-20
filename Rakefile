require 'rye'

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
