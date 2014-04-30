# instanceid.rb
#This script creates and populates the AWS instance ID fact.
Facter.add("instanceid") do
  setcode do
        Facter::Util::Resolution.exec('/usr/bin/curl -sf http://169.254.169.254/latest/meta-data/instance-id;echo ""')
   end
end
