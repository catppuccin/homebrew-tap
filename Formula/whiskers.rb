class Whiskers < Formula
  desc "Soothing port creation tool for the high-spirited!"
  homepage "https://github.com/catppuccin/whiskers"
  url "https://github.com/catppuccin/whiskers/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "a42c72f951ffadca0ea41dbb9d22ad8578dd7d196dce5e044e20954189112270"
  license "MIT"
  head "https://github.com/catppuccin/whiskers.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a9ccd88fe4ace414676e0d96df1f777fac6a9a4f1778655c8e7bd454293a4c33"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "07d314bba1e42236e85a29ed29e8dc75e6e34cadf819482a3b6c881922c9d939"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_path_exists (bin/"whiskers"), :exist?
  end
end
