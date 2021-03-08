
  unit TestConsts;

interface

  uses
    Deltics.StringTypes;


  const
    AnsiCapitalA      : AnsiChar  = 'A';
    Utf8CapitalA      : Utf8Char  = 'A';
    WideCapitalA      : WideChar  = 'A';

    AnsiCopyright     : AnsiChar  = '©';
    WideCopyright     : WideChar  = '©';

    // Copyright symbol in Utf8 requires a continuation byte and so
    //  is represented by a 'string' rather than a single Utf8Char
    Utf8Copyright     : Utf8String = #$c2#$a9;

    AnsiEmpty         : AnsiString = '';
    AnsiDigits        : AnsiString = '12345';
    AnsiSpaces        : AnsiString = '  ';
    AnsiCRs           : AnsiString = #13#13;
    AnsiLFs           : AnsiString = #10#10;
    AnsiTABs          : AnsiString = #9#9;
    AnsiWhitespace    : AnsiString = #9#10#13 + ' ';

    Utf8Empty         : Utf8String = '';
    Utf8Digits        : Utf8String = '12345';
    Utf8Spaces        : Utf8String = '  ';
    Utf8CRs           : Utf8String = #13#13;
    Utf8LFs           : Utf8String = #10#10;
    Utf8TABs          : Utf8String = #9#9;
    Utf8Whitespace    : Utf8String = #9#10#13 + ' ';

    UnicodeEmpty      : UnicodeString = '';
    UnicodeDigits     : UnicodeString = '12345';
    UnicodeSpaces     : UnicodeString = '  ';
    UnicodeCRs        : UnicodeString = #13#13;
    UnicodeLFs        : UnicodeString = #10#10;
    UnicodeTABs       : UnicodeString = #9#9;
    UnicodeWhitespace : UnicodeString = #9#10#13 + ' ';

    WideEmpty         : WideString = '';
    WideDigits        : WideString = '12345';
    WideSpaces        : WideString = '  ';
    WideCRs           : WideString = #13#13;
    WideLFs           : WideString = #10#10;
    WideTABs          : WideString = #9#9;
    WideWhitespace    : WideString = #9#10#13 + ' ';

  // Treble Clef char is a surrogate pair in Utf16
  var
    WideTrebleClef    : WideString;


implementation

initialization
  SetLength(WideTrebleClef, 2);
  WideTrebleClef[1] := WideChar($D834);
  WideTrebleClef[2] := WideChar($DD1E);
end.
