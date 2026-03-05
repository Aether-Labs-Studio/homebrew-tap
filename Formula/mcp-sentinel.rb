class McpSentinel < Formula
  desc "Zero Trust proxy/firewall for the Model Context Protocol"
  homepage "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.4.0/mcp-sentinel-v1.4.0-darwin-arm64"
      sha256 "dfee1ea775d66761ee44b7209ae9644b81007ec652b3c114b93790061a698501"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.4.0/mcp-sentinel-v1.4.0-darwin-amd64"
      sha256 "ac90f74545b2aea851f3d4c9516e1efe038251fa2a2b507bf9c8e511f2ab1f70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.4.0/mcp-sentinel-v1.4.0-linux-arm64"
      sha256 "99a9042723acd158f9a31920234ffa09a2b7c4bfa9bbd96b57f1b867fb07a0af"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.4.0/mcp-sentinel-v1.4.0-linux-amd64"
      sha256 "52b03ea58ea552c3079696e6200906a010593c39b2d4af53d0a0bc75ffcf1f06"
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
