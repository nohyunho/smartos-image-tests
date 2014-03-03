require 'spec_helper'

# Make sure pkgin is updated first
describe command('pkgin -y up') do
  it { should return_exit_status 0 }
end


## Since 13.3.1. See IMAGE-437
if attr[:base_version].delete('.').to_i >= 1331
  # wget package now preinstalled (works around the problem where the OS wget wasn't
  # happy with https URLs)
  describe package('wget') do
  it { should be_installed }
  end
end

## Since 13.3.0
# See IMAGE-340, IMAGE-404
# rsyslog pre-installed and running out of the box (in place of legacy syslog); has guardtime support built-in
if attr[:base_version].delete('.').to_i >= 1330
  describe package('rsyslog') do
  it { should be_installed }
  end
end

## Common packages

describe package('smtools') do
  it { should be_installed }
end

describe package('nodejs') do
  it { should be_installed }
end

# Starting with 13.4.0, sdc-manta and sdc-smartdc are no longer installed by default. IMAGE-460.
if attr[:base_version].delete('.').to_i < 1340
	describe package('sdc-manta') do
  	it { should be_installed }
	end

	describe package('sdc-smartdc') do
  	it { should be_installed }
	end
end

describe package('guardtime') do
  it { should be_installed }
end

describe package('duo-unix') do
  it { should be_installed }
end

describe package('curl') do
  it { should be_installed }
end

describe package('mozilla-rootcerts') do
  it { should be_installed }
end
