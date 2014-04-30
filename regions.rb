# region.rb
#This script creates and populates the AWS region fact.
Facter.add("region") do
  setcode do
        Facter::Util::Resolution.exec('/usr/bin/curl -sf http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" \'{print $4}\'')
   end
end
