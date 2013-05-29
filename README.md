Arabic Letter Connector
=======================

Motivation
----------

Arabic is not always well-supported in all libraries. There are two problems that often occur when
attempting to present Arabic text:

1. The letters appear in reverse order (often because there is no right-to-left support).
2. The letters appear disconnected.

This gem deals with the second problem. If you are this problem, it normally means your
string use the _generic_ form of every Arabic letter (that is, without any attributed form, 
for example a _Qaf_ not a _Qaf at the beginning of a word_), and the library
you are using to present this string doesn't do anything about it.

What this gem does is replace each such _generic_ character to a character _with form_.

Acknowledgment
--------------

This gem is a refactored version of `Arabic-Prawn` by Dynamix Solutions (Ahmed Nasser).

Installation
------------

Simply run:

    gem install arabic-letter-connector

Then require it with:

    require 'arabic-letter-connector'

Usage
-----

The gem provides a `ArabicLetterConnector.transform(string)` method, and also monkey-patches `String`
to include a `connect_arabic_letters` method.

Below is an example. In the browser, it might appear that this library is doing nothing (since the browser
does the work of converting the characters from their generic form considering their correct form). Try
it in IRB to get a sense of what is happening.

    x = "مرحبا يا العالم"
    x[0].unpack("C*")            # [217, 133] 
    y = x.connect_arabic_letters # "ﻣﺮﺣﺒﺎ ﻳﺎ ﺍﻟﻌﺎﻟﻢ"
    y[0].unpack("C*")            # [239, 187, 163]

This gem is particular useful if you are using `prawn` to generate PDF files.

    require 'prawn'
    require 'arabic-letter-connector'
    Prawn::Document.generate("arabic.pdf") do
      text_direction :rtl
      font("/path/to/arabic/font.ttf") do
        text "مرحبا يا العالم".connect_arabic_letters
      end
    end
