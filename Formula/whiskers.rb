class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.9.0.tar.gz"
  sha256 "107363ac13f259118bac3124958699a8933b89aaa5ca2a9c9d601bd6969d7983"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4e2ea79d8f57dce78e47052db19fccb7bac78e98b425b42e3cac2ead0f91a403"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "80137c0f7e726d938af5f99f9c2cb1f8fccbcbf0a45ce7b7c99b8b8eba502077"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_path_exists (bin/"whiskers"), :exist?
  end
end
