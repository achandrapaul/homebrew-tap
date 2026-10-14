class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/achandrapaul/digest"
  url "https://github.com/achandrapaul/digest/archive/refs/tags/v0.0.158.tar.gz"
  sha256 "a793b49b34df170251b6bce1225db2051c24103aa7f034d34bcb50518141d124"
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
