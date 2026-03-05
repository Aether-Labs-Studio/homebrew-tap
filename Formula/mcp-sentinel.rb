class McpSentinel < Formula
  desc "Zero Trust proxy/firewall for the Model Context Protocol"
  homepage "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.4.1/mcp-sentinel-v1.4.1-darwin-arm64"
      sha256 "bdf08a2694d797b55302cb130d0360124ba64a6610a4633a4c2efa85317cc5ad"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.4.1/mcp-sentinel-v1.4.1-darwin-amd64"
      sha256 "f7024b02801fe1f2ed3d39bb8740a73547aa113c06dc8eb68889b8ad5fc327a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.4.1/mcp-sentinel-v1.4.1-linux-arm64"
      sha256 "0167e45548fa8bd59bf4b7c13255cf3a41f6947032ebb361975416ec78710019"
    end
    on_intel do
      url "https://github.com/Aether-Labs-Studio/mcp-aether-sentinel/releases/download/v1.4.1/mcp-sentinel-v1.4.1-linux-amd64"
      sha256 "234113c3788a818d4ded969cac2a88b9af3ef9da8be92afd3608d5cba54f915d"
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
