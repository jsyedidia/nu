;; test_characters.nu
;;  tests for Nu character literals.
;;
;;  Copyright (c) 2007 Tim Burks, Neon Design Technology, Inc.

(class TestCharacters is NuTestCase
     
     (imethod (id) testRegularCharacters is
          (set a 'a')
          (set Z 'Z')
          (set LPAREN '(')
          (set RPAREN ')')
          (set SEMICOLON ';')
          (set HASH '#')
          (set golden "aZ();#")
          (assert_equal (golden characterAtIndex:0) a)
          (assert_equal (golden characterAtIndex:1) Z)
          (assert_equal (golden characterAtIndex:2) LPAREN)
          (assert_equal (golden characterAtIndex:3) RPAREN)
          (assert_equal (golden characterAtIndex:4) SEMICOLON)
          (assert_equal (golden characterAtIndex:5) HASH))
     
     (imethod (id) testEscapedCharacters is
          (assert_equal 10 '\n')
          (assert_equal 13 '\r')
          (assert_equal 12 '\f')
          (assert_equal 8  '\b')
          (assert_equal 7  '\a')
          (assert_equal 27 '\e')
          (assert_equal 32 '\s'))
     
     (imethod (id) testOctalEscapedCharacters is
          (if (eq (uname) "Darwin") ;; requires UTF-8
              (assert_equal 0 '\000'))
          (assert_equal 1 '\001')
          (assert_equal 255 '\377'))
     
     (imethod (id) testHexEscapedCharacters is
          (if (eq (uname) "Darwin") ;; requires UTF-8
              (assert_equal 0 '\x00'))
          (assert_equal 1 '\x01')
          (assert_equal 255 '\xfF'))
     
     (if (eq (uname) "Darwin") ;; requires UTF-8
         (imethod (id) testUnicodeEscapedCharacters is
              (assert_equal 0 '\u0000')
              (assert_equal 1 '\u0001')
              (assert_equal 65535 '\uFfFf')
              (assert_equal 255 '\u00ff')))
     
     (imethod (id) testFourCharacterIntegers is
          (assert_equal 1886604404 'psLt')
          (assert_equal 1886601524 'psA4')))


