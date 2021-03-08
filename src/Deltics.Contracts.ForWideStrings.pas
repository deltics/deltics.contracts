
{$i deltics.contracts.inc}

  unit Deltics.Contracts.ForWideStrings;


interface

  uses
    Deltics.Contracts.Base,
    Deltics.Contracts.Interfaces;


  type
    WideStringContractsImpl = class(ContractsImpl, StringContracts,
                                                   IProvidesLength)
    private
      fValue: String;
    public
      constructor Create(const aValue: WideString); overload;
      constructor Create(const aArgument: String; const aValue: WideString); overload;
      procedure GetLength(out aVar: Integer);
      function IsLongerThan(const aLength: Integer): IProvidesLength; overload;
      function IsLongerThan(const aOtherArgument: String; const aLength: Integer): IProvidesLength; overload;
      function IsNotEmpty: IProvidesLength;
      function IsNotEmptyOrWhitespace: IProvidesLength;
      function IsNotLongerThan(const aLength: Integer): IProvidesLength; overload;
      function IsNotLongerThan(const aOtherArgument: String; const aLength: Integer): IProvidesLength; overload;
    end;



implementation

  uses
    SysUtils,
    Windows;



  function WideStringToAnsi(const aValue: WideString): AnsiString;
  var
    len: Integer;
  begin
    result := '';
    if Length(aValue) = 0 then
      EXIT;

    len := WideCharToMultiByte(CP_ACP, 0, PWideChar(aValue), -1, NIL, 0, NIL, NIL);

    // With max len = -1 then the reported length INCLUDES the null terminator
    //  which is automatically part of result
    Dec(len);
    SetLength(result, len);

    WideCharToMultiByte(CP_ACP, 0, PWideChar(aValue), -1, PAnsiChar(result), 0, NIL, NIL);
  end;



{ WideStringContractsImpl }

  constructor WideStringContractsImpl.Create(const aValue: WideString);
  begin
    inherited Create;

    fValue        := aValue;
    ValueAsString := {$ifdef UNICODE} aValue {$else} WideStringToAnsi(aValue) {$endif};
  end;


  constructor WideStringContractsImpl.Create(const aArgument: String;
                                             const aValue: WideString);
  begin
    inherited Create(aArgument);

    fValue        := aValue;
    ValueAsString := {$ifdef UNICODE} aValue {$else} WideStringToAnsi(aValue) {$endif};
  end;


  procedure WideStringContractsImpl.GetLength(out aVar: Integer);
  begin
    aVar := Length(fValue);
  end;


  function WideStringContractsImpl.IsLongerThan(const aLength: Integer): IProvidesLength;
  begin
    if Length(fValue) <= aLength then
      RaiseException('{argument} must be longer than {required}', IntToStr(aLength));

    result := self;
  end;


  function WideStringContractsImpl.IsLongerThan(const aOtherArgument: String;
                                                const aLength: Integer): IProvidesLength;
  begin
    if Length(fValue) <= aLength then
      RaiseException('{argument} must be longer than {required}', aOtherArgument);

    result := self;
  end;


  function WideStringContractsImpl.IsNotEmpty: IProvidesLength;
  begin
    if Length(fValue) = 0 then
      RaiseException('{argument} cannot be an empty string');

    result := self;
  end;


  function WideStringContractsImpl.IsNotEmptyOrWhitespace: IProvidesLength;

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
        if not (ANSIChar(fValue[i]) in WHITESPACE) then
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


  function WideStringContractsImpl.IsNotLongerThan(const aLength: Integer): IProvidesLength;
  begin
    if Length(fValue) > aLength then
      RaiseException('Length of {argument} is greater than {required}', IntToStr(aLength));

    result := self;
  end;


  function WideStringContractsImpl.IsNotLongerThan(const aOtherArgument: String;
                                                   const aLength: Integer): IProvidesLength;
  begin
    if Length(fValue) > aLength then
      RaiseException('{argument} is longer than {required}', aOtherArgument);

    result := self;
  end;



end.
