class McpSentinel < Formula
  desc "Zero Trust proxy/firewall for the Model Context Protocol"
  homepage "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel"
  version "1.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.2.4/mcp-sentinel-v1.2.4-darwin-arm64"
      sha256 "2c8d2e35f45d8098343ee37813f907e52aee8fd6438b8ddb749d37c4a3d32ff6"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.2.4/mcp-sentinel-v1.2.4-darwin-amd64"
      sha256 "40f0ea5b463f6cd7a5bde22be5fc2450463ffe4f885cd325a3b6d72c2b85d0f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.2.4/mcp-sentinel-v1.2.4-linux-arm64"
      sha256 "988ce5a7f75524b4cd24db177d7b049db802773f09dc99be4ae264ca2ede437f"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.2.4/mcp-sentinel-v1.2.4-linux-amd64"
      sha256 "9a863fdce0d2726db0227b3f08fab829dddbc352734dbf1f9285762e4f25ff14"
    end
  end

  def install
    bin.install Dir["mcp-sentinel*"].first => "mcp-sentinel"
  end

  test do
    output = shell_output("#{bin}/mcp-sentinel 2>&1", 1)
    assert_match "usage", output
  end
end
