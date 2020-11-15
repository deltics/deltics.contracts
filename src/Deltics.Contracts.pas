
{$i deltics.contracts.inc}

  unit Deltics.Contracts;


interface

  uses
    SysUtils,
    Deltics.Exceptions;


  type
    CoreContractMethodsBase = class;
    CoreContracts = class of CoreContractMethodsBase;
    CoreContractsWithOptionalArgumentNaming = class of CoreContractMethods;


    CoreContractMethodsBase = class
    public
      class procedure Assigned(const aValue);
      class procedure NotEmpty(const aValue: String); overload;
      class procedure NotEmpty(const aValue: String; var aReturnsLength: Integer); overload;
    {$ifdef UNICODE}
      class procedure NotEmpty(const aValue: AnsiString); overload;
      class procedure NotEmpty(const aValue: AnsiString; var aReturnsLength: Integer); overload;
    {$endif}
      class procedure NotEmpty(const aValue: WideString); overload;
      class procedure NotEmpty(const aValue: WideString; var aReturnsLength: Integer); overload;
      class procedure NotGreaterThan(aMaximumValue, aValue: Integer);
      class procedure NotLessThan(aMinimumValue, aValue: Integer);
      class procedure ValidIndexForString(const aString: String; aIndex: Integer); overload;
    {$ifdef UNICODE}
      class procedure ValidIndexForString(const aString: AnsiString; aIndex: Integer); overload;
    {$endif}
      class procedure ValidIndexForString(const aString: WideString; aIndex: Integer); overload;
    end;


    CoreContractMethods = class(CoreContractMethodsBase)
    public
      class function Argument(const aName: String): CoreContracts;
    end;


    EArgumentException = Deltics.Exceptions.EArgumentException;


  function Require: CoreContractsWithOptionalArgumentNaming; overload;
  procedure Require(aValue: Boolean; const aMessage: String = ''); overload;


  // This may look a little odd but there is method in the madness...
  //
  // By declaring a procedure type for the RaiseArgumentExceptionProc, any frameworks
  //  which wish to extend the CoreContractMethods class (e.g. deltics.strings) can
  //  re-declare their own RaiseArgumentException constant and set it equal to the
  //  method in this unit:
  //
  //  const
  //    RaiseArgumentException : RaiseArgumentExceptionProc = Deltics.Contracts._RaiseArgumentException;
  //
  // Consumers of the unit containing the CoreContractMethods extension in that framework
  //  are then able to also DIRECTLY call the RaiseArgumentException method via that
  //  constant, without having to also use the underlying Deltics.Contracts unit or
  //  a wrapper method.

  type
    RaiseArgumentExceptionProc = procedure(const aMessage: String);

  procedure _RaiseArgumentException(const aMessage: String);

  const
    RaiseArgumentException : RaiseArgumentExceptionProc = _RaiseArgumentException;


implementation


  var
    _ArgumentName: String = '';


  procedure _RaiseArgumentException(const aMessage: String);
  begin
    Require(FALSE, aMessage);
  end;


  function Require: CoreContractsWithOptionalArgumentNaming;
  begin
    result := CoreContractMethods;
  end;


  procedure Require(      aValue: Boolean;
                    const aMessage: String);
  var
    msg: String;
  begin
    if aValue then
      EXIT;

    msg := StringReplace(aMessage, 'argument ', _ArgumentName + ' ', [rfReplaceAll, rfIgnoreCase]);

    if msg = '' then
      msg := 'Invalid argument'
    else
      msg := 'Invalid argument.  ' + msg;

    _ArgumentName := '';

    raise EArgumentException.Create(msg);
  end;




{ Contract --------------------------------------------------------------------------------------- }

  class function CoreContractMethods.Argument(const aName: String): CoreContracts;
  begin
    _ArgumentName := aName;

    result := CoreContractMethods;
  end;


  class procedure CoreContractMethodsBase.Assigned(const aValue);
  var
    p: Pointer absolute aValue;
  begin
    Require(System.Assigned(p), 'Argument{arg} cannot be NIL');
  end;


  class procedure CoreContractMethodsBase.NotEmpty(const aValue: String);
  begin
    Require(aValue <> '', 'Argument cannot be an empty string');
  end;


  class procedure CoreContractMethodsBase.NotEmpty(const aValue: String;
                                                   var   aReturnsLength: Integer);
  begin
    aReturnsLength := Length(aValue);
    Require(aReturnsLength > 0, 'Argument cannot be an empty string');
  end;


{$ifdef UNICODE}

  class procedure CoreContractMethodsBase.NotEmpty(const aValue: AnsiString);
  begin
    Require(aValue <> '', 'Argument cannot be an empty string');
  end;


  class procedure CoreContractMethodsBase.NotEmpty(const aValue: AnsiString;
                                                   var   aReturnsLength: Integer);
  begin
    aReturnsLength := Length(aValue);
    Require(aReturnsLength > 0, 'Argument cannot be an empty string');
  end;

{$endif}


  class procedure CoreContractMethodsBase.NotEmpty(const aValue: WideString);
  begin
    Require(aValue <> '', 'Argument cannot be an empty string');
  end;


  class procedure CoreContractMethodsBase.NotEmpty(const aValue: WideString;
                                                   var   aReturnsLength: Integer);
  begin
    aReturnsLength := Length(aValue);
    Require(aReturnsLength > 0, 'Argument cannot be an empty string');
  end;


  class procedure CoreContractMethodsBase.NotGreaterThan(aMaximumValue: Integer;
                                                         aValue: Integer);
  begin
    Require(aValue <= aMaximumValue, Format('Argument cannot be greater than %d', [aMaximumValue]));
  end;


  class procedure CoreContractMethodsBase.NotLessThan(aMinimumValue: Integer;
                                                      aValue: Integer);
  begin
    Require(aValue >= aMinimumValue, Format('Argument cannot be less than %d', [aMinimumValue]));
  end;


  class procedure CoreContractMethodsBase.ValidIndexForString(const aString: String;
                                                                    aIndex: Integer);
  begin
    Require((aIndex <= Length(aString)) and (aIndex > 0),
            'Argument is not a valid index for string');
  end;


{$ifdef UNICODE}

  class procedure CoreContractMethodsBase.ValidIndexForString(const aString: AnsiString;
                                                                    aIndex: Integer);
  begin
    Require((aIndex <= Length(aString)) and (aIndex > 0),
            'Argument is not a valid index for string');
  end;

{$endif}


  class procedure CoreContractMethodsBase.ValidIndexForString(const aString: WideString;
                                                                    aIndex: Integer);
  begin
    Require((aIndex <= Length(aString)) and (aIndex > 0),
            'Argument is not a valid index for string');
  end;





end.
