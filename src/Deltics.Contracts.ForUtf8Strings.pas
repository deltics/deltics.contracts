
{$i deltics.contracts.inc}

  unit Deltics.Contracts.ForUtf8Strings;


interface

  uses
    Deltics.Contracts.Base,
    Deltics.Contracts.Interfaces,
    Deltics.StringTypes;


  type
    Utf8StringContractsImpl = class(ContractsImpl, StringContracts,
                                                      IProvidesLength)
    private
      fValue: Utf8String;
    public
      constructor Create(const aValue: Utf8String); overload;
      constructor Create(const aArgument: String; const aValue: Utf8String); overload;
      procedure GetLength(out aVar: Integer);
      function IsNotEmpty: IProvidesLength;
      function IsNotEmptyOrWhitespace: IProvidesLength;
    end;



implementation

  uses
    Windows;


  function Utf8ToUnicode(const aValue: Utf8String): UnicodeString;
  var
    len: Integer;
  begin
    result := '';

    len := MultiByteToWideChar(CP_UTF8, 0, PAnsiChar(aValue), 1, NIL, 0);

    // With max len = -1 then the reported length INCLUDES the null terminator
    //  which is automatically part of result
    Dec(len);
    SetLength(result, len);

    MultiByteToWideChar(CP_UTF8, 0, PAnsiChar(aValue), 1, PWideChar(result), len);
  end;


  function UnicodeToAnsi(const aValue: UnicodeString): AnsiString;
  var
    len: Integer;
  begin
    result := '';

    len := WideCharToMultiByte(CP_ACP, 0, PWideChar(aValue), 1, NIL, 0, NIL, NIL);

    // With max len = -1 then the reported length INCLUDES the null terminator
    //  which is automatically part of result
    Dec(len);
    SetLength(result, len);

    WideCharToMultiByte(CP_ACP, 0, PWideChar(aValue), 1, PAnsiChar(result), 0, NIL, NIL);
  end;


  function Utf8ToAnsi(const aValue: Utf8String): AnsiString;
  begin
    result := UnicodeToAnsi(Utf8ToUnicode(aValue));
  end;




{ Utf8StringContractsImpl }

  constructor Utf8StringContractsImpl.Create(const aValue: Utf8String);
  begin
    inherited Create;

    fValue        := aValue;
    ValueAsString := {$ifdef UNICODE}Utf8ToUnicode(aValue){$else}Utf8ToAnsi(aValue){$endif};
  end;


  constructor Utf8StringContractsImpl.Create(const aArgument: String;
                                             const aValue: Utf8String);
  begin
    inherited Create(aArgument);

    fValue        := aValue;
    ValueAsString := {$ifdef UNICODE}Utf8ToUnicode(aValue){$else}Utf8ToAnsi(aValue){$endif};
  end;


  procedure Utf8StringContractsImpl.GetLength(out aVar: Integer);
  begin
    aVar := Length(fValue);
  end;


  function Utf8StringContractsImpl.IsNotEmpty: IProvidesLength;
  begin
    if Length(fValue) = 0 then
      RaiseException('{argument} cannot be an empty string');

    result := self;
  end;


  function Utf8StringContractsImpl.IsNotEmptyOrWhitespace: IProvidesLength;

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
        if not (Utf8Char(fValue[i]) in WHITESPACE) then
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
