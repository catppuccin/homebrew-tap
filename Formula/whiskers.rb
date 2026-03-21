class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "a42c72f951ffadca0ea41dbb9d22ad8578dd7d196dce5e044e20954189112270"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "68c9cde9d9820cdb8581f01d7d555417324a8cc4984db15a6866282fb51d39e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "492a3a0c8bf5a18287508c5951ec6c96a2b3b9f7cefe5f0b87af53504c47b85a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_path_exists (bin/"whiskers"), :exist?
  end
end
