require 'spec_helper'
require 'zombie'

describe Zombie do

  context "eating brains" do
    subject(:zombie) { Zombie.new }
    before { zombie.eat_brains }

    it { expect { zombie.eat_brains }.to change { zombie.iq }.by(3) }
    it { zombie.should_not be_dummy }
    it { zombie.should be_genius }
  end

  context "low iq zombie" do
    subject(:zombie) { Zombie.new }

    its(:iq) { should == 0 }
    it { expect { zombie.make_decision! }.to raise_error(Zombie::NotSmartEnoughError) }
    it_behaves_like 'the brainless'
  end

  context "high iq zombie", focus: true do
    subject { Zombie.new(iq: 3) }

    it { should be_genius }
    its(:brains_eaten_count) { should == 1 }
  end
end
