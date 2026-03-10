class McpSentinel < Formula
  desc "Community Edition local MCP proxy with static regex blocking"
  homepage "https://github.com/Aether-Labs-Studio/mcp-sentinel"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-sentinel/releases/download/v1.1.0/mcp-sentinel-v1.1.0-darwin-arm64"
      sha256 "2db792e4582d46075739ed3e2ee6146114f5445bc582eb4f53afa23e0cf18e2f"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-sentinel/releases/download/v1.1.0/mcp-sentinel-v1.1.0-darwin-amd64"
      sha256 "802bc285ac27f387f0733718a24236bb0cc7a706b2596fd4ba17b23c288e67be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-sentinel/releases/download/v1.1.0/mcp-sentinel-v1.1.0-linux-arm64"
      sha256 "75b63326141f28ad8608b96d467097fdc5c36ebe1fa8787b6ff0312ea66ae494"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-sentinel/releases/download/v1.1.0/mcp-sentinel-v1.1.0-linux-amd64"
      sha256 "1aa697f6834f142f448cea5c0da1067b18dd124a826f0d7015678bee10797e93"
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
