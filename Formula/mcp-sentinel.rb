class McpSentinel < Formula
  desc "Zero Trust proxy/firewall for the Model Context Protocol"
  homepage "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.3.0/mcp-sentinel-v1.3.0-darwin-arm64"
      sha256 "ce718aa35efc64f5ed62f4b535f378bddd401e093f5c332eb71f060c26e184e0"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.3.0/mcp-sentinel-v1.3.0-darwin-amd64"
      sha256 "c8aa4921b86e94b2b9aa12054c0a40855df1522cbe51429aa6506e1ef9ad31f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.3.0/mcp-sentinel-v1.3.0-linux-arm64"
      sha256 "2b85ba7a4e96de6cd09aaf5502d43e5d9e1003e0eff76cbee98cbeee73461997"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.3.0/mcp-sentinel-v1.3.0-linux-amd64"
      sha256 "cc95d61e8f3846383abb4c1bb6ed3b5a45b3db1e5d2bf6ed24ebd7488c12b26c"
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
