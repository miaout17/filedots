Feature: Install dotfiles
  In order to install dotfiles
  I executed filedots install

  @announce-stdout
  @announce-stderr
  Scenario: First time using house
    Given a file named ".filedots" with:
      """
      link "bashrc"
      """
    And a file named "bashrc" with:
      """
      HelloWorld
      """
    When I run `filedots install`
    Then the file "../home/.bashrc" should contain "HelloWorld"

