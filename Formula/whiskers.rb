class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.10.0.tar.gz"
  sha256 "3b3246948abd37318064d65f102566ea4fda027ba00f54bdb5765914adafc780"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4382f08139bfa754049b0338a05b1b3dcbf4fcfea8d68e9a8817f8154a2fb53c"
    sha256 cellar: :any,                 x86_64_linux: "b6a2788ad54ecb0561667994a77105efb17979af4f472f10ff2c33e3a988ef53"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_path_exists (bin/"whiskers"), :exist?
  end
end
