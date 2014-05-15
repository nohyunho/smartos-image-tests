require 'spec_helper'

describe file('/opt/local/share/cassandra/conf/cassandra.yaml') do
  it { should be_file }
  it { should contain 'listen_address: localhost' }
end

describe command ('ZONENAME=$(zonename) && grep -q "cluster_name: \'${ZONENAME}\'" /opt/local/share/cassandra/conf/cassandra.yaml') do
  it { should return_exit_status 0 }
end
