
{$i deltics.contracts.inc}

  unit Deltics.Contracts.Interfaces;


interface

  type
    IntegerContracts = interface;
    StringContracts = interface;

    IProvidesLength = interface;


    CharContracts = interface
      procedure IsNotNull;
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

      function IsValidIndexForString(const aString: String): IProvidesLength; overload;
    {$ifdef UNICODE}
      function IsValidIndexForString(const aString: AnsiString): IProvidesLength; overload;
    {$endif}
      function IsValidIndexForString(const aString: WideString): IProvidesLength; overload;
    end;


    PointerContracts = interface
      procedure IsAssigned;
    end;


    StringContracts = interface
      function IsNotEmpty: IProvidesLength;
      function IsNotEmptyOrWhitespace: IProvidesLength;
    end;


    IProvidesLength = interface
      procedure GetLength(out aVar: Integer);
    end;



implementation



end.
