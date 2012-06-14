# StateMachineSetters

Adds setters for state machine events to trigger state transitions by setting attributes.

## Usage

    class ExampleModel < ActiveRecord::Base
      state_machine :state do
        event :pay do
          transition :unpaid => :paid
        end
      end

      state_machine_setter :state
    end

    @example = ExampleModel.new
    @example.pay = true # triggers @example.pay

    # params[:example] == {:pay => {:purchased_by_id => 10, :purchase_amount => 50}}
    @example.update_attributes(params[:example]) # will set the attributes with the hash then call `pay`

## Installation

Add this line to your application's Gemfile:

    gem 'state_machine_setters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install state_machine_setters

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
