Feature: Clean dotfiles
  In order to uninstall dotfiles
  I executed "filedots clean"

  Scenario: Cleaning dotfiles
    Given a file named ".filedots" with:
      """
      link "bashrc"
      """
    And a file named "bashrc" with:
      """
      HelloWorld
      """
    And a file named "../.bashrc" with:
      """
      HelloWorld
      """
    When I run `filedots clean`
    Then a file named "../.bashrc" should not exist
