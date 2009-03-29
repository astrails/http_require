require 'example_helper'

describe "HttpRequire" do

  BASE = "http://foobar.com"
  A = "#{BASE}/a.rb"
  B = "#{BASE}/b.rb"

  before do
    FakeWeb.clean_registry
  end

  it "should eval file from a web" do
    FakeWeb.register_uri(:get, A, :string => "A")
    self.expects(:eval).with("A", anything, A)
    require A
  end

  it "should set http_require_base" do
    FakeWeb.register_uri(:get, A, :string => "A")
    self.expects(:with_http_require_base).with(BASE)
    require A
  end

  it "should require from web when http_require_base is set" do
    FakeWeb.register_uri(:get, A, :string => "A")
    self.expects(:eval).with('A', anything, A)
    with_http_require_base(BASE) do
      require 'a.rb'
    end
  end

  it "should add '.rb' if missing" do
    FakeWeb.register_uri(:get, A, :string => "A")
    self.expects(:eval).with('A', anything, A)
    with_http_require_base(BASE) do
      require 'a'
    end
  end

end
