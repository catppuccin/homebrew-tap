class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/toolbox/tree/main/whiskers"
  url "https://github.com/catppuccin/toolbox/archive/refs/tags/whiskers-v1.1.1.tar.gz"
  sha256 "baae7de466b48a808f25ef87f7dc94765c67ddda656d4b2813a19012580b00af"
  license "MIT"
  head "https://github.com/catppuccin/toolbox.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "whiskers")
  end

  test do
    assert_predicate (bin/"whiskers"), :exist?
  end
end
