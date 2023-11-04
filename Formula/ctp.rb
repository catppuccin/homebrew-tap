class Ctp < Formula
  desc "Soothing pastel theme manager"
  homepage "https://github.com/catppuccin/cli"
  url "https://github.com/catppuccin/cli/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "476cd9664afd58e64a4430e2462cb09d159f31e29119a82bcb02b305b99e30cd"
  license "MIT"
  head "https://github.com/catppuccin/cli.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    sha256 cellar: :any_skip_relocation, ventura:      "e55e62b2da4275d8e06c3cbdafc41b3a07bbcc67e0b164d07b8ac984861c19c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "04cc61a92e5a948ef058193b491d965ee7e719f4c04bf54c96216a23744eb789"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/ctp"
  end

  test do
    assert_predicate (bin/"ctp"), :exist?
  end
end
