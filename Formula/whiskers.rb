class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.9.0.tar.gz"
  sha256 "107363ac13f259118bac3124958699a8933b89aaa5ca2a9c9d601bd6969d7983"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c68b102c012ad9fa09c588a7f4cdaf7c4d10cf71736f4cc7750b15e9f5057ee9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4d2d4a19572f6e919705fd39f7d13cfddbd64f4cca325f300fd18c44c6fb6940"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_path_exists (bin/"whiskers"), :exist?
  end
end
