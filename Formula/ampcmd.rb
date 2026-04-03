class Ampcmd < Formula
  desc "Chain multiple shell history commands using fuzzy selection"
  homepage "https://github.com/soundslikeinfo/ampcmd"
  url "https://github.com/soundslikeinfo/ampcmd/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "fdf72b24dc4c7f85fc4c1a141765ec76a5feb8567323ba702c48f94e4c848ac8"
  license "MIT"
  head "https://github.com/soundslikeinfo/ampcmd.git", branch: "main"

  depends_on "fzf"

  def install
    prefix.install "src/ampcmd.zsh"
    prefix.install "src/ampcmd.plugin.zsh"
    prefix.install "src/ampcmd.bash"
    prefix.install "src/ampcmd-preview.sh"
    
    (share/"fish/vendor_functions.d").install "src/ampcmd.fish"
    (share/"fish/vendor_functions.d").install "src/ampcmd-preview.sh"
  end

  def caveats
    <<~EOS
      Add to your shell config:
      
      Zsh (~/.zshrc):
        source #{opt_prefix}/ampcmd.plugin.zsh
      
      Bash (~/.bashrc):
        source #{opt_prefix}/ampcmd.bash
      
      Fish (~/.config/fish/config.fish):
        bind \\ch 'ampcmd'
      
      Then: exec $SHELL
    EOS
  end

  test do
    assert_path_exists prefix/"ampcmd.plugin.zsh"
    assert_path_exists prefix/"ampcmd.bash"
    assert_path_exists share/"fish/vendor_functions.d/ampcmd.fish"
  end
end