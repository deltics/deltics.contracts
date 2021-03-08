
{$i deltics.contracts.inc}

  unit Deltics.Contracts.ForUnicodeStrings;


interface

  uses
    Deltics.Contracts.Base,
    Deltics.Contracts.Interfaces,
    Deltics.StringTypes;


  type
    UnicodeStringContractsImpl = class(ContractsImpl, StringContracts,
                                                      IProvidesLength)
    private
      fValue: UnicodeString;
    public
      constructor Create(const aValue: UnicodeString); overload;
      constructor Create(const aArgument: String; const aValue: UnicodeString); overload;
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
    SysUtils;



{ UnicodeStringContractsImpl }

  constructor UnicodeStringContractsImpl.Create(const aValue: UnicodeString);
  begin
    inherited Create;

    fValue        := aValue;
    ValueAsString := aValue;
  end;


  constructor UnicodeStringContractsImpl.Create(const aArgument: String;
                                                const aValue: UnicodeString);
  begin
    inherited Create(aArgument);

    fValue        := aValue;
    ValueAsString := aValue;
  end;


  procedure UnicodeStringContractsImpl.GetLength(out aVar: Integer);
  begin
    aVar := Length(fValue);
  end;


  function UnicodeStringContractsImpl.IsLongerThan(const aLength: Integer): IProvidesLength;
  begin
    if Length(fValue) <= aLength then
      RaiseException('{argument} must be longer than {required}', IntToStr(aLength));

    result := self;
  end;


  function UnicodeStringContractsImpl.IsLongerThan(const aOtherArgument: String;
                                                   const aLength: Integer): IProvidesLength;
  begin
    if Length(fValue) <= aLength then
      RaiseException('{argument} must be longer than {required}', aOtherArgument);

    result := self;
  end;


  function UnicodeStringContractsImpl.IsNotEmpty: IProvidesLength;
  begin
    if Length(fValue) = 0 then
      RaiseException('{argument} cannot be an empty string');

    result := self;
  end;


  function UnicodeStringContractsImpl.IsNotEmptyOrWhitespace: IProvidesLength;

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


  function UnicodeStringContractsImpl.IsNotLongerThan(const aLength: Integer): IProvidesLength;
  begin
    if Length(fValue) > aLength then
      RaiseException('Length of {argument} is greater than {required}', IntToStr(aLength));

    result := self;
  end;


  function UnicodeStringContractsImpl.IsNotLongerThan(const aOtherArgument: String;
                                                      const aLength: Integer): IProvidesLength;
  begin
    if Length(fValue) > aLength then
      RaiseException('{argument} is longer than {required}', aOtherArgument);

    result := self;
  end;



end.
