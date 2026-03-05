class McpSentinel < Formula
  desc "Zero Trust proxy/firewall for the Model Context Protocol"
  homepage "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel"
  version "1.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.3.1/mcp-sentinel-v1.3.1-darwin-arm64"
      sha256 "8e7c18a2797efcf32c4907c1fc3f7774606ba7c8f1a7ae8e18f890d748331073"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.3.1/mcp-sentinel-v1.3.1-darwin-amd64"
      sha256 "e54dd772ce69ca2263a18dc4fee12361cfe247ae50c0c8af74b4fe21fa445881"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.3.1/mcp-sentinel-v1.3.1-linux-arm64"
      sha256 "e15cdbcf0832369a5f98c4e5caf2325a36f7202d02d51c0f728c3980fafe9dc3"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.3.1/mcp-sentinel-v1.3.1-linux-amd64"
      sha256 "eed186d9473f341f96712a09b47f0a24554c83334136193759c73e911ed4fa3d"
    end
  end

  def install
    bin.install Dir["mcp-sentinel*"].first => "mcp-sentinel"
  end

  def caveats
    <<~EOS
      To configure your MCP clients (Claude Code, Cursor, Gemini CLI, etc.), run:
        curl -fsSL https://raw.githubusercontent.com/Aether-Labs-Studio/mcp-aether-sentinel/main/install.sh | SKIP_BINARY=1 sh

      This will auto-detect installed clients and register mcp-sentinel in each one.
    EOS
  end

  test do
    output = shell_output("#{bin}/mcp-sentinel 2>&1", 1)
    assert_match "usage", output
  end
end
