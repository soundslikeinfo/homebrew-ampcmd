class Ampcmd < Formula
  desc "Chain multiple shell history commands using fuzzy selection"
  homepage "https://github.com/soundslikeinfo/ampcmd"
  url "https://github.com/soundslikeinfo/ampcmd/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ec136f6546e0230393aef4becdc29e9d52d2a6d7f7324087f16653fe724f06d8"
  license "MIT"
  head "https://github.com/soundslikeinfo/ampcmd.git", branch: "main"

  depends_on "fzf"

  def install
    prefix.install "src/ampcmd.zsh"
    prefix.install "src/ampcmd.plugin.zsh"
    prefix.install "src/ampcmd.bash"
    prefix.install "src/ampcmd.fish"
    prefix.install "src/ampcmd-preview.sh"
  end

  def caveats
    <<~EOS
      Add to your shell config:
      
      Zsh (~/.zshrc):
        source #{opt_prefix}/ampcmd.plugin.zsh
      
      Bash (~/.bashrc):
        source #{opt_prefix}/ampcmd.bash
      
      Fish (~/.config/fish/config.fish):
        source #{opt_prefix}/ampcmd.fish
        bind \\ch 'ampcmd'
      
      Then: exec $SHELL
    EOS
  end

  test do
    assert_path_exists prefix/"ampcmd.plugin.zsh"
    assert_path_exists prefix/"ampcmd.bash"
    assert_path_exists prefix/"ampcmd.fish"
  end
end