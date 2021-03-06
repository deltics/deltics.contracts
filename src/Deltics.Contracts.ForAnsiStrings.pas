
{$i deltics.contracts.inc}

  unit Deltics.Contracts.ForAnsiStrings;


interface

uses
    Deltics.Contracts.Base,
    Deltics.Contracts.Interfaces,
    Deltics.StringTypes;


  type
    AnsiStringContractsImpl = class(ContractsImpl, StringContracts,
                                                   IProvidesLength)
    private
      fValue: AnsiString;
    public
      constructor Create(const aValue: AnsiString); overload;
      constructor Create(const aArgument: String; const aValue: AnsiString); overload;
      procedure GetLength(out aVar: Integer);
      function IsNotEmpty: IProvidesLength;
      function IsNotEmptyOrWhitespace: IProvidesLength;
    end;



implementation

  uses
    Windows;


  function AnsiStringToUnicode(const aValue: AnsiString): UnicodeString;
  var
    len: Integer;
  begin
    result := '';
    if Length(aValue) = 0 then
      EXIT;

    len := MultiByteToWideChar(CP_ACP, 0, PAnsiChar(aValue), -1, NIL, 0);

    // With max len = -1 then the reported length INCLUDES the null terminator
    //  which is automatically part of result
    Dec(len);
    SetLength(result, len);

    MultiByteToWideChar(CP_ACP, 0, PAnsiChar(aValue), -1, @result[1], len);
  end;



{ AnsiStringContractsImpl }

  constructor AnsiStringContractsImpl.Create(const aValue: AnsiString);
  begin
    inherited Create;

    fValue        := aValue;
    ValueAsString := {$ifdef UNICODE} AnsiStringToUnicode(aValue) {$else} aValue {$endif};
  end;


  constructor AnsiStringContractsImpl.Create(const aArgument: String;
                                             const aValue: AnsiString);
  begin
    inherited Create(aArgument);

    fValue        := aValue;
    ValueAsString := {$ifdef UNICODE} AnsiStringToUnicode(aValue) {$else} aValue {$endif};
  end;


  procedure AnsiStringContractsImpl.GetLength(out aVar: Integer);
  begin
    aVar := Length(fValue);
  end;


  function AnsiStringContractsImpl.IsNotEmpty: IProvidesLength;
  begin
    if Length(fValue) = 0 then
      RaiseException('{argument} cannot be an empty string');

    result := self;
  end;


  function AnsiStringContractsImpl.IsNotEmptyOrWhitespace: IProvidesLength;

    function IsWhitespace: Boolean;
    const
      TAB   = #9;
      LF    = #10;
      CR    = #13;
      SPACE = ' ';
      WHITESPACE = [TAB, LF, CR, SPACE];
    var
      i: Integer;
    begin
      result := FALSE;

      for i := 1 to Length(fValue) do
        if not (fValue[i] in WHITESPACE) then
          EXIT;

      result := TRUE;
    end;

  begin
    if Length(fValue) = 0 then
      RaiseException('{argument} cannot be an empty string');

    if IsWhitespace then
      RaiseException('{argument} cannot consist entirely of whitespace');

    result := self;
  end;



end.
