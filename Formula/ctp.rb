class Ctp < Formula
  desc "Soothing pastel theme manager"
  homepage "https://github.com/catppuccin/cli"
  url "https://github.com/catppuccin/cli/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "476cd9664afd58e64a4430e2462cb09d159f31e29119a82bcb02b305b99e30cd"
  license "MIT"
  head "https://github.com/catppuccin/cli.git", branch: "main"

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
