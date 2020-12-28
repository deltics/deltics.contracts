
{$i deltics.contracts.inc}

  unit Deltics.Contracts.Base;


interface

  uses
    Classes;


  type
    ContractsImpl = class(TInterfacedObject)
    private
      fArgument: String;
      fRequired: String;
      fRequiredName: String;
      fValue: String;
    private
      function Interpolate(const aString: String): String;
    protected
      procedure RaiseException(const aMessage: String); overload;
      procedure RaiseException(const aMessage: String; const aRequired: String); overload;
      procedure RaiseException(const aMessage: String; const aRequiredName: String; const aRequired: String); overload;
      property Required: String write fRequired;
      property RequiredName: String write fRequiredName;
      property ValueAsString: String write fValue;
    public
      constructor Create; overload;
      constructor Create(const aArgument: String); overload;
    end;


implementation

  uses
    SysUtils,
    Deltics.Exceptions;


  procedure RaiseArgumentException(const aMessage: String); {$ifdef InlineMethods} inline; {$endif}
  begin
    raise EArgumentException.Create(aMessage);
  end;



  constructor ContractsImpl.Create;
  begin
    inherited Create;

    fArgument := 'anonymous';
  end;


  constructor ContractsImpl.Create(const aArgument: String);
  begin
    inherited Create;

    fArgument := aArgument;
  end;


  function ContractsImpl.Interpolate(const aString: String): String;

    procedure Replace(const aToken: String; const aValue: String);
    begin
      if Pos('{' + aToken + '}', result) = -1 then
        raise EInvalidOperation.CreateFmt('No value for token ''%s''', [aToken]);

      result := StringReplace(result, '{' + aToken + '}', aValue, [rfReplaceAll, rfIgnoreCase]);
    end;

  begin
    result := aString;

    Replace('argument', fArgument);
    Replace('requiredName', fRequiredName);
    Replace('required', fRequired);
    Replace('value', fValue);
  end;


  procedure ContractsImpl.RaiseException(const aMessage: String);
  begin
    RaiseArgumentException(Interpolate(aMessage));
  end;


  procedure ContractsImpl.RaiseException(const aMessage: String;
                                         const aRequired: String);
  begin
    Required := aRequired;

    RaiseException(aMessage);
  end;


  procedure ContractsImpl.RaiseException(const aMessage: String;
                                         const aRequiredName: String;
                                         const aRequired: String);
  begin
    Required      := aRequired;
    RequiredName  := aRequiredName;

    RaiseException(aMessage);
  end;







end.
