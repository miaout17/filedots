Feature: Install dotfiles
  In order to install dotfiles
  I executed "filedots install"

  Scenario: First time installation
    Given a file named ".filedots" with:
      """
      link "bashrc"
      """
    And a file named "bashrc" with:
      """
      HelloWorld
      """
    When I run `filedots install`
    Then the file "../.bashrc" should contain "HelloWorld"

