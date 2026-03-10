class McpSentinel < Formula
  desc "Community Edition local MCP proxy with static regex blocking"
  homepage "https://github.com/Aether-Labs-Studio/mcp-sentinel"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-sentinel/releases/download/v1.0.0/mcp-sentinel-v1.0.0-darwin-arm64"
      sha256 "38a5aebfb12dd58fbb6757590d2563a14d82624b5cb54bf93eda16dec4ee634d"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-sentinel/releases/download/v1.0.0/mcp-sentinel-v1.0.0-darwin-amd64"
      sha256 "6068503072be2d016bd903fa1e2eccd7070af50f63be205515210e9743284327"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-sentinel/releases/download/v1.0.0/mcp-sentinel-v1.0.0-linux-arm64"
      sha256 "61d22d2786cbd98668c9e247ca5b102012c9ee97fbed6d341222b1e7d53f6ae3"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-sentinel/releases/download/v1.0.0/mcp-sentinel-v1.0.0-linux-amd64"
      sha256 "5f176f8c06b751c68ada690e76ef102e508c4a7c6a5609c8f5a462f801de6943"
    end
  end

  def install
    bin.install Dir["mcp-sentinel*"].first => "mcp-sentinel"
  end

  def caveats
    <<~EOS
      To configure your MCP clients (Claude Code, Cursor, Gemini CLI, etc.), run:
        curl -fsSL https://raw.githubusercontent.com/Aether-Labs-Studio/mcp-sentinel/main/install.sh | SKIP_BINARY=1 sh

      This will auto-detect installed clients and register the Community Edition
      mcp-sentinel binary in each one.
      The binary path used will be: #{opt_bin}/mcp-sentinel
    EOS
  end

  test do
    output = shell_output("#{bin}/mcp-sentinel 2>&1", 1)
    assert_match "usage", output
  end
end
