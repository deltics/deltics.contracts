
  unit TestConsts;

interface

  uses
    Deltics.StringTypes;


  const
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




implementation

end.
