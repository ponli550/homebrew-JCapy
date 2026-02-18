# typed: false
# frozen_string_literal: true

class Jcapy < Formula
  include Language::Python::Virtualenv

  desc "JCapy CLI - One-Army Orchestrator for developers"
  homepage "https://github.com/ponli550/JCapy"
  url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.7.tar.gz"
  sha256 "38797fe2168ff77f448b98775ffb690b05572892057ee8458612d5d5fce43c25"
  license "MIT"
  head "https://github.com/ponli550/JCapy.git", branch: "main"

  depends_on "python@3.11"

  resource "rich" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.5.tar.gz"
    sha256 "1e99ecf63c40339fe8ce47045df66ef32c3e99910824ae3da21ab3681cadb777"
  end

  resource "markdown-it-py" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.5.tar.gz"
    sha256 "1e99ecf63c40339fe8ce47045df66ef32c3e99910824ae3da21ab3681cadb777"
  end

  resource "mdurl" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.5.tar.gz"
    sha256 "1e99ecf63c40339fe8ce47045df66ef32c3e99910824ae3da21ab3681cadb777"
  end

  resource "pygments" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.5.tar.gz"
    sha256 "1e99ecf63c40339fe8ce47045df66ef32c3e99910824ae3da21ab3681cadb777"
  end

            def install
    # Install into virtualenv
    venv = virtualenv_create(libexec, "python3.11")

    # Install dependencies via pip (synced from pyproject.toml)
    venv.pip_install "rich>=13.0.0"
    venv.pip_install "mcp>=1.2.0"
    venv.pip_install "chromadb>=0.4.0"
    venv.pip_install "posthog>=3.0.0"
    venv.pip_install "textual>=0.50.0"
    venv.pip_install "PyYAML>=6.0"
    venv.pip_install "python-dotenv>=1.0.0"

    # Install jcapy package
    venv.pip_install buildpath

    # Create bin symlink
    bin.install_symlink libexec/"bin/jcapy"
  end

  test do
    assert_match "jcapy", shell_output("#{bin}/jcapy help")
  end
end
