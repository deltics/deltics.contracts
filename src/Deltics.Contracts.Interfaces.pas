
{$i deltics.contracts.inc}

  unit Deltics.Contracts.Interfaces;


interface

  uses
    Deltics.StringTypes;

  type
    IntegerContracts = interface;
    StringContracts = interface;

    IProvidesLength = interface;


    CharContracts = interface
      procedure IsAscii; overload;
      procedure IsNotNull;
    end;


    AnsiCharContracts = interface(CharContracts)
    end;


    Utf8CharContracts = interface(CharContracts)
      procedure IsLeadByte;
      procedure IsNotContinuation;
    end;


    WideCharContracts = interface(CharContracts)
      procedure IsNotSurrogate;
      procedure IsSurrogate;
    end;


    IntegerContracts = interface
      procedure IsGreaterThan(aValue: Integer);
      procedure IsGreaterThanOrEqual(aValue: Integer); overload;
      procedure IsGreaterThanOrEqual(aValue: Integer; const aName: String); overload;
      procedure IsNotGreaterThan(aValue: Integer);
      procedure IsNotLessThan(aValue: Integer);
      procedure IsPositiveOrZero;

      function IsValidIndexFor(const aString: AnsiString): IProvidesLength; overload;
      function IsValidIndexFor(const aString: UnicodeString): IProvidesLength; overload;
    {$ifdef UNICODE}
      function IsValidIndexFor(const aString: Utf8String): IProvidesLength; overload;
      function IsValidIndexFor(const aString: WideString): IProvidesLength; overload;
    {$endif}
      function IsValidIndexForUtf8(const aString: Utf8String): IProvidesLength; overload;
    end;


    PointerContracts = interface
      procedure IsAssigned;
    end;


    StringContracts = interface
      function IsLongerThan(const Length: Integer): IProvidesLength; overload;
      function IsLongerThan(const aOtherArgument: String; const Length: Integer): IProvidesLength; overload;
      function IsNotEmpty: IProvidesLength;
      function IsNotEmptyOrWhitespace: IProvidesLength;
      function IsNotLongerThan(const Length: Integer): IProvidesLength; overload;
      function IsNotLongerThan(const aOtherArgument: String; const Length: Integer): IProvidesLength; overload;
    end;


    IProvidesLength = interface
      procedure GetLength(out aVar: Integer);
    end;



implementation



end.
