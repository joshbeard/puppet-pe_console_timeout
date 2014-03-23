# pe_console_timeout

## Synopsis

Allows easy customization of the Puppet Enterprise Console session timeout.

The default is 1200 seconds.

## Parameters

### `timeout_interval`

Session timeout, in seconds.  Defaults to `1200`

## Usage

To set the timeout to 1 hour:

```
class { 'pe_console_timeout':
  timeout_interval => '3600',
}
```

Or in Hiera:

`pe_console_timeout::timeout_interval: '3600'`

## Notes

Tested with Puppet Enterprise 3.2.x

## Dependencies

`puppetlabs/stdlib` for parameter validation