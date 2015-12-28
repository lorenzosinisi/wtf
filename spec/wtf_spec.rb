require 'spec_helper'

describe Wtf do
  after(:all) do
    if Wtf::Doc.has_documentation?
      File.delete(Wtf::Doc.current_path + '/.wtf')
    end
  end
  it 'has a version number' do
    expect(Wtf::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(false)
  end
end
