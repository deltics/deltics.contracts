
{$i deltics.contracts.inc}

  unit Deltics.Contracts.ForIntegers;


interface

  uses
    Deltics.Contracts.Base,
    Deltics.Contracts.Interfaces,
    Deltics.StringTypes;


  type
    IntegerContractsImpl = class(ContractsImpl, IntegerContracts)
    private
      fValue: Integer;
    public
      constructor Create(const aArgument: String; aValue: Integer);
      procedure IsGreaterThan(aValue: Integer);
      procedure IsGreaterThanOrEqual(aValue: Integer); overload;
      procedure IsGreaterThanOrEqual(aValue: Integer; const aName: String); overload;
      procedure IsLessThan(aValue: Integer);
      procedure IsNotGreaterThan(aValue: Integer);
      procedure IsNotLessThan(aValue: Integer);
      procedure IsPositiveOrZero;
      function IsValidIndexFor(const aString: AnsiString): IProvidesLength; overload;
      function IsValidIndexFor(const aString: UnicodeString): IProvidesLength; overload;
    {$ifdef UNICODE}
      function IsValidIndexFor(const aString: Utf8String): IProvidesLength; overload;
      function IsValidIndexFor(const aString: WideString): IProvidesLength; overload;
    {$endif}
      function IsValidIndexForUtf8(const aString: Utf8String): IProvidesLength;
    end;




implementation

  uses
    SysUtils,
    Deltics.Contracts.ForAnsiStrings,
    Deltics.Contracts.ForUnicodeStrings,
    Deltics.Contracts.ForUtf8Strings,
    Deltics.Contracts.ForWideStrings;



{ IntegerContractsImpl }

  constructor IntegerContractsImpl.Create(const aArgument: String;
                                                aValue: Integer);
  begin
    inherited Create(aArgument);

    fValue := aValue;

    ValueAsString := IntToStr(aValue);
  end;


  procedure IntegerContractsImpl.IsGreaterThan(aValue: Integer);
  begin
    if fValue <= aValue then
      RaiseException('{argument} ({value}) must be greater than {required}', IntToStr(aValue));
  end;


  procedure IntegerContractsImpl.IsGreaterThanOrEqual(aValue: Integer);
  begin
    if fValue < aValue then
      RaiseException('{argument} ({value}) must be greater than or equal to {required}', IntToStr(aValue));
  end;


  procedure IntegerContractsImpl.IsGreaterThanOrEqual(aValue: Integer; const aName: String);
  begin
    if fValue < aValue then
      RaiseException('{argument} ({value}) must be greater than or equal to {requiredName} (required)', aName, IntToStr(aValue));
  end;


  procedure IntegerContractsImpl.IsLessThan(aValue: Integer);
  begin
    if fValue >= aValue then
      RaiseException('{argument} ({value}) must be less than {required}', IntToStr(aValue));
  end;


  procedure IntegerContractsImpl.IsNotGreaterThan(aValue: Integer);
  begin
    if fValue > aValue then
      RaiseException('{argument} ({value}) cannot be greater than {required}', IntToStr(aValue));
  end;


  procedure IntegerContractsImpl.IsNotLessThan(aValue: Integer);
  begin
    if fValue < aValue then
      RaiseException('{argument} ({value}) cannot be less than {required}', IntToStr(aValue));
  end;


  procedure IntegerContractsImpl.IsPositiveOrZero;
  begin
    if fValue < 0 then
      RaiseException('{argument} ({value}) must be positive or zero (0)');
  end;


  function IntegerContractsImpl.IsValidIndexFor(const aString: AnsiString): IProvidesLength;
  begin
    if (fValue <= 0) or (fValue > Length(aString)) then
      RaiseException('{argument} is not a valid index ({value}) for string ({required})', '1..' + IntToStr(Length(aString)));

    result := AnsiStringContractsImpl.Create(aString);
  end;


  function IntegerContractsImpl.IsValidIndexFor(const aString: UnicodeString): IProvidesLength;
  begin
    if (fValue <= 0) or (fValue > Length(aString)) then
      RaiseException('{argument} is not a valid index ({value}) for string ({required})', '1..' + IntToStr(Length(aString)));

    result := UnicodeStringContractsImpl.Create(aString);
  end;


{$ifdef UNICODE}
  function IntegerContractsImpl.IsValidIndexFor(const aString: Utf8String): IProvidesLength;
  begin
    if (fValue <= 0) or (fValue > Length(aString)) then
      RaiseException('{argument} is not a valid index ({value}) for string ({required})', '1..' + IntToStr(Length(aString)));

    result := Utf8StringContractsImpl.Create(aString);
  end;


  function IntegerContractsImpl.IsValidIndexFor(const aString: WideString): IProvidesLength;
  begin
    if (fValue <= 0) or (fValue > Length(aString)) then
      RaiseException('{argument} is not a valid index ({value}) for string ({required})', '1..' + IntToStr(Length(aString)));

    result := WideStringContractsImpl.Create(aString);
  end;
{$endif}


  function IntegerContractsImpl.IsValidIndexForUtf8(const aString: Utf8String): IProvidesLength;
  begin
    if (fValue <= 0) or (fValue > Length(aString)) then
      RaiseException('{argument} is not a valid index ({value}) for string ({required})', '1..' + IntToStr(Length(aString)));

    result := Utf8StringContractsImpl.Create(aString);
  end;


end.
