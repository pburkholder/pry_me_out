
chef_gem 'pry-remote'
require 'pry-remote'

file "/usr/bin/chef-pry" do
    content <<-BINSTUB.gsub(/^ {6}/, "")
      #!/usr/bin/env sh
      GEM_HOME="#{Gem.paths.home}"; export GEM_HOME;
      GEM_PATH="#{Gem.paths.path.join(":")}"; export GEM_PATH;
      GEM_CACHE="#{Gem.paths.home.}/cache"; export GEM_CACHE;
      unset RUBYOPT GEMRC;
      exec "#{RbConfig::CONFIG["bindir"]}/ruby" "#{Gem.bindir}/pry-remote" "$@";
    BINSTUB
    mode 0555
end.run_action(:create)

