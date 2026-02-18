# typed: false
# frozen_string_literal: true

class Jcapy < Formula
  include Language::Python::Virtualenv

  desc "JCapy CLI - One-Army Orchestrator for developers"
  homepage "https://github.com/ponli550/JCapy"
  url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.2.tar.gz"
  sha256 "38e5e3c1517faeb65388321596e61f03cb528e5ba9e0e31999452f7cf7d598f8"
  license "MIT"
  head "https://github.com/ponli550/JCapy.git", branch: "main"

  depends_on "python@3.11"

  resource "rich" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.2.tar.gz"
    sha256 "38e5e3c1517faeb65388321596e61f03cb528e5ba9e0e31999452f7cf7d598f8"
  end

  resource "markdown-it-py" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.2.tar.gz"
    sha256 "38e5e3c1517faeb65388321596e61f03cb528e5ba9e0e31999452f7cf7d598f8"
  end

  resource "mdurl" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.2.tar.gz"
    sha256 "38e5e3c1517faeb65388321596e61f03cb528e5ba9e0e31999452f7cf7d598f8"
  end

  resource "pygments" do
    url "https://github.com/ponli550/JCapy/archive/refs/tags/v4.1.2.tar.gz"
    sha256 "38e5e3c1517faeb65388321596e61f03cb528e5ba9e0e31999452f7cf7d598f8"
  end

  def install
    # Install into virtualenv
    venv = virtualenv_create(libexec, "python3.11")

    # Install dependencies via pip (more reliable than resources)
    venv.pip_install "rich>=13.0.0"
    venv.pip_install "pygments"
    venv.pip_install "markdown-it-py"

    # Install jcapy package
    venv.pip_install buildpath

    # Create bin symlink
    bin.install_symlink libexec/"bin/jcapy"
  end

  test do
    assert_match "jcapy", shell_output("#{bin}/jcapy help")
  end
end
