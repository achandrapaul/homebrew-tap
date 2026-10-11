class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/achandrapaul/digest"
  url "https://github.com/achandrapaul/digest/archive/refs/tags/v0.0.156.tar.gz"
  sha256 "684860febe209ea2cea4568425aeb9a077aaaa5c800f6b2a74395ce16dd273ac"
  license "MIT"
  head "https://github.com/achandrapaul/digest.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "terminal-notifier"

  def install
    ldflags = "-X github.com/achandrapaul/digest/pkg/tui.appVersion=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/digest"
  end

  test do
    assert_match "install", shell_output("#{bin}/digest --help 2>&1")
  end
end
