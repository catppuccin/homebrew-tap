class Ctp < Formula
  desc "Soothing pastel theme manager"
  homepage "https://github.com/catppuccin/cli"
  url "https://github.com/catppuccin/cli/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "476cd9664afd58e64a4430e2462cb09d159f31e29119a82bcb02b305b99e30cd"
  license "MIT"
  head "https://github.com/catppuccin/cli.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/catppuccin/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "3f59595e141a8afdfdc2f722d0f722a0d3af67fafed1fd1217abbbb471e0cc1a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "08e0d1a6ab38e9bbf3ad2895986b1cd6c7f12fc0234a4c25eea30e173aebb04d"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/ctp"
  end

  test do
    assert_predicate (bin/"ctp"), :exist?
  end
end
