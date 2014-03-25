source ENV['GEM_SOURCE'] || "https://rubygems.org"

group :development, :test do
  gem 'puppetlabs_spec_helper',  :require => false
  gem 'puppet-lint',             :require => false

  case RUBY_VERSION
  when /^1.8/
    gem 'rake', "~> 10.1.1",     :require => false
  else
    gem 'rake',                  :require => false
  end

end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby
