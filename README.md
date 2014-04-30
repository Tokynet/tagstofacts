tagstofacts
===========

Some scripts to aide in the creation of facts from AWS Tags

I put the scripts in:
/etc/puppet/modules/**$MODULENAME**/lib/facter/

instanceid.rb and regions.rb make simple get calls to get information from *meta-data*.

tagstofacts.rb makes a *ec2 API* call and plainly (read ugly) greps and awks the values we care for. Its an ugly setup, since each puppet run will make 5 ec2 calls, multiply that x the number of instances you have and you might get blocked from making API calls.

**You WILL need an IAM role that allows the instances to query "EC2 describe instances"**

Eventually I will try to make this either dump the tags to a dot file in /tmp or learn more ruby and make the output an array and read get all the values in 1 API call.

Feel free to send pull request if you improve this script.
