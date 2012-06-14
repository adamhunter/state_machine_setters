require "state_machine"
require "state_machine_setters/version"

module StateMachineSetters

  def state_machine_setter(state_machine_name)
    ensure_state_machine!(state_machine_name)
    add_state_machine_setters(state_machine_name)
  end

  private

  def ensure_state_machine!(name)
    return if respond_to?(:state_machines) && state_machines[name]
    raise MissingStateMachineError.new("#{name} has not been defined.")
  end

  def add_state_machine_setters(name)
    state_machines[name].events.map(&:name).each do |event|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{event}=(value)
          self.attributes = value if value.is_a?(Hash)
          #{event}
        end
      RUBY
    end
  end

  class MissingStateMachineError < StandardError ; end

end

Object.extend StateMachineSetters
