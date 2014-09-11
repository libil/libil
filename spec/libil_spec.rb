require 'libil'

describe Libil, "#tokenize" do
  it "returns correct token for non expletive words" do
    p = "dagadu"
    expect(Libil::tokenize(p)).to eq(['d','a','g','a','d','u'])
  end
  
  it "returns correct token for digraphs" do
    expect(Libil::tokenize("dhahar")).to eq(['dh', 'a', 'h', 'a', 'r'])
    expect(Libil::tokenize("bathuk")).to eq(['b', 'a', 'th', 'u', 'k'])
    expect(Libil::tokenize("ngarang")).to eq(['ng', 'a', 'r', 'a', 'ng'])
    expect(Libil::tokenize("Dhahar")).to eq(['Dh', 'a', 'h', 'a', 'r'])
  end
  
  it "returns correct remap" do
    expect(Libil::c_remap("b")).to eq("s")
  end

  it "returns correct string even if it's started with vocal" do
    expect(Libil::convert("ngising")).to eq("libil")
    expect(Libil::convert("asu bajingan")).to eq("pabu saciladh")
    expect(Libil::convert("Cahe Dewe")).to eq("Jape Methe")
  end

  it "returns correct reverse string" do
    expect(Libil::convert("sangi")).to eq("bali")
    expect(Libil::convert("nyothe")).to eq("kowe")
  end

  it "returns reversed Malang Style string" do
    expect(Libil::convert_ngalam("motor")).to eq("rotom")
    expect(Libil::convert_ngalam("Malang")).to eq("Ngalam")
    expect(Libil::convert_ngalam("Motor Malang")).to eq("Rotom Ngalam")
  end
end
