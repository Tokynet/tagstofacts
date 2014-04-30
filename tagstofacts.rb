# tag_name.rb

#We make an ec2 call and put the tags in a dot file in tmp
set code do /usr/bin/aws --output text ec2 describe-instances --instance-ids #{instanceid} | grep "TAGS" | awk '{ print $2 " " $3 " " $4}' > /tmp/.tags
#Create the fact from the NAME (EC2) TAG
Facter.add("tag_name") do
   setcode do
          region = Facter.value('region')
          instanceid = Facter.value('instanceid')
          %x{/usr/bin/aws --region #{region} --output text ec2 describe-instances --instance-ids #{instanceid} | egrep -iw "Name" | tr [:upper:] [:lower
:] | /bin/awk '{ print $3 }'}.chomp
   end
end

#Create the fact from the SDLC (EC2) TAG
Facter.add("tag_sdlc") do
   setcode do
          region = Facter.value('region')
          instanceid = Facter.value('instanceid')
          %x{/usr/bin/aws --region #{region} --output text ec2 describe-instances --instance-ids #{instanceid} | egrep -iw "SDLC" | tr [:upper:] [:lower
:] | /bin/awk '{ print $3 }'}.chomp
   end
end

##Create the fact from the OWNER (EC2) TAG
Facter.add("tag_owner") do
   setcode do
          region = Facter.value('region')
          instanceid = Facter.value('instanceid')
          %x{/usr/bin/aws --region #{region} --output text ec2 describe-instances --instance-ids #{instanceid} | egrep -iw "OWNER" | tr [:upper:] [:lowe
r:] | /bin/awk '{ print $3 " " $4 }'}.chomp
   end
end

##Create the fact from the AGS (EC2) TAG
Facter.add("tag_ags") do
   setcode do
          region = Facter.value('region')
          instanceid = Facter.value('instanceid')
          %x{/usr/bin/aws --region #{region} --output text ec2 describe-instances --instance-ids #{instanceid} | egrep -iw "AGS" | tr [:upper:] [:lower:
] | /bin/awk '{ print $3 }'}.chomp
   end
end

##Create the fact from the PURPOSE (EC2) TAG
Facter.add("tag_purpose") do
   setcode do
          region = Facter.value('region')
          instanceid = Facter.value('instanceid')
          %x{/usr/bin/aws --region #{region} --output text ec2 describe-instances --instance-ids #{instanceid} | egrep -iw "PURPOSE" | tr [:upper:] [:lo
wer:] | /bin/awk '{ print $3 }'}.chomp
   end
end

#Create the fact from the Cost Center (EC2) TAG
Facter.add("tag_cost-center") do
   setcode do
          region = Facter.value('region')
          instanceid = Facter.value('instanceid')
          %x{/usr/bin/aws --region #{region} --output text ec2 describe-instances --instance-ids #{instanceid} | egrep -iw "Cost Center" | tr [:upper:] 
[:lower:] | /bin/awk '{ print $4 }'}.chomp
   end
end
