include_recipe "nginx"
include_recipe "jenkins::master"

# Jenkins plugins
# ---------------
node[:jenkins][:server][:plugins].each do |name|
  jenkins_plugin name
end

# Jenkins jobs
# ------------
node[:jenkins][:jobs].each do |job|
    server_home = node[:jenkins][:master][:home]
    server_user = node[:jenkins][:master][:user]

    job_name = "#{job[:name]}-#{job[:branch]}-#{node[:os]}-#{node[:kernel][:machine]}"
    job_config = File.join(server_home, "#{job_name}-config.xml")

    # Compile job configuration
    template job_config do
        source "job.xml.erb"
        owner server_user
        group server_user
        mode 0444
        variables (job)
        notifies :reload, "service[nginx]", :delayed
    end

    # Setup resource
    jenkins_job job_name do
        config job_config
    end
end

# jenkins_cli "safe-restart"
