Feature: Install dotfiles
  In order to install dotfiles
  I executed filedots install

  Scenario: First time using house
    Given a file named ".filedots" with:
      """
      bashrc
      """
    And a file named "bashrc" with:
      """
      HelloWorld
      """
    When I run `cat .filedots`
    Then the file "../home/.bashrc" should contain "HelloWorld"

