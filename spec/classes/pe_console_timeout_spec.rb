require 'spec_helper'

describe 'pe_console_timeout' do

  context 'with default params' do
    let(:facts) {{ :is_pe => true }}
    it do should contain_file_line('maximum_session_lifetime').with(
      'line' => 'maximum_session_lifetime: 1200'
    )
    end

    it do should contain_file_line('session_timeout').with(
      'line' => '  session_timeout: 1200'
    )
    end
  end

  context 'with timeout_interval set to 3600' do
    let(:facts) {{ :is_pe => true }}
    let(:params) {{ :timeout_interval => 3600 }}
    it do should contain_file_line('maximum_session_lifetime').with(
      'line' => 'maximum_session_lifetime: 3600'
    )
    end

    it do should contain_file_line('session_timeout').with(
      'line' => '  session_timeout: 3600'
    )
    end
  end

  context 'when timeout_interval is non-integer' do
    let(:facts) {{ :is_pe => true }}
    let(:params) {{ :timeout_interval => 'l33t' }}
    it do
      expect {
        should compile
      }.to raise_error(Puppet::Error, /timeout_interval must be an integer/)
    end
  end

  context 'when not Puppet Enterprise (is_pe fact missing)' do
    it do
      expect {
        should compile
      }.to raise_error(Puppet::Error, /pe_console_timeout only works on Puppet Enterprise/)
    end
  end
end
