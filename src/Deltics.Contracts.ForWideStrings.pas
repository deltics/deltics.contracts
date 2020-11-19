
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
      constructor Create(const aValue: String); overload;
      constructor Create(const aArgument: String; const aValue: String); overload;
      procedure GetLength(out aVar: Integer);
      function IsNotEmpty: IProvidesLength;
      function IsNotEmptyOrWhitespace: IProvidesLength;
    end;



implementation

{ WideStringContractsImpl }

  constructor WideStringContractsImpl.Create(const aValue: String);
  begin
    inherited Create;

    fValue        := aValue;
    ValueAsString := aValue;
  end;


  constructor WideStringContractsImpl.Create(const aArgument: String;
                                             const aValue: String);
  begin
    inherited Create(aArgument);

    fValue        := aValue;
    ValueAsString := aValue;
  end;


  procedure WideStringContractsImpl.GetLength(out aVar: Integer);
  begin
    aVar := Length(fValue);
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



end.
