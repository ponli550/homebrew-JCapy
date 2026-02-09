# typed: false
# frozen_string_literal: true

class Jcapy < Formula
  include Language::Python::Virtualenv

  desc "JCapy CLI - One-Army Orchestrator for developers"
  homepage "https://github.com/ponli550/JCapy"
  url "https://github.com/ponli550/JCapy/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "614698f9393b1a72d8980ca046fad699ff2b037137b219dbaa4f70bfa0e81874"
  license "MIT"
  head "https://github.com/ponli550/JCapy.git", branch: "main"

  depends_on "python@3.11"

  resource "rich" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v2.2.1.tar.gz"
    sha256 "614698f9393b1a72d8980ca046fad699ff2b037137b219dbaa4f70bfa0e81874"
  end

  resource "markdown-it-py" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v2.2.1.tar.gz"
    sha256 "614698f9393b1a72d8980ca046fad699ff2b037137b219dbaa4f70bfa0e81874"
  end

  resource "mdurl" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v2.2.1.tar.gz"
    sha256 "614698f9393b1a72d8980ca046fad699ff2b037137b219dbaa4f70bfa0e81874"
  end

  resource "pygments" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v2.2.1.tar.gz"
    sha256 "614698f9393b1a72d8980ca046fad699ff2b037137b219dbaa4f70bfa0e81874"
  end

  def install
    # Install into virtualenv
    venv = virtualenv_create(libexec, "python3.11")

    # Install dependencies
    venv.pip_install resources

    # Install jcapy package
    venv.pip_install buildpath

    # Create bin symlink
    bin.install_symlink libexec/"bin/jcapy"
  end

  test do
    assert_match "jcapy", shell_output("#{bin}/jcapy help")
  end
end
