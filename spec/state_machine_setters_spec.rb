require 'spec_helper'

describe StateMachineSetters do
  it "is a module" do
    StateMachineSetters.should be_a(Module)
  end

  it "loads state machine" do
    Class.should respond_to(:state_machine)
  end

  it "adds `state_machine_setter` to class" do
    Class.should respond_to(:state_machine_setter)
  end

  it "will raise a missing state_machine error when calling state_machine_setter without defining any state_machine first" do
    expect { Class.state_machine_setter :some_machine }.to raise_error(StateMachineSetters::MissingStateMachineError)
  end

  it "will raise a missing state_machine error when calling state_machine_setter without defining the state_machine first" do
    expect { StateMachineExample.state_machine_setter :some_machine }.to raise_error(StateMachineSetters::MissingStateMachineError)
  end

  describe "instances" do
    before :each do
      @example = StateMachineExample.new
    end

    it "adds a setter for each defined state transition in a class" do
      @example.should respond_to(:run=)
    end

    it "will pass given attributes to an attributes= method when called" do
      @example.should_receive(:attributes=).with(:awesome => 'yes')
      @example.run = {:awesome => 'yes'}
    end

    it "will not pass attributes to attributes= if no hash is provided" do
      @example.should_not_receive(:attributes=)
      @example.run = true
    end

    it "will call the respective state transition when calling the setter" do
      @example.should_receive(:run)
      @example.run = true
    end
  end
end
