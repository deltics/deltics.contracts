
{$i deltics.contracts.inc}

  unit Deltics.Contracts.ForPointers;


interface

  uses
    Deltics.Contracts.Base,
    Deltics.Contracts.Interfaces;


  type
    PointerContractsImpl = class(ContractsImpl, PointerContracts)
    private
      fValue: Pointer;
    public
      constructor Create(const aArgument: String; aValue: Pointer);
      procedure IsAssigned;
    end;




implementation

  uses
    SysUtils;


{ PointerContractsImpl }

  constructor PointerContractsImpl.Create(const aArgument: String;
                                                aValue: Pointer);
  type
    IntPtr = {$ifdef 64BIT} Int64 {$else} Integer {$endif};
  begin
    inherited Create(aArgument);

    fValue := aValue;

    ValueAsString := Format('%.x', [IntPtr(aValue)]);
  end;


  procedure PointerContractsImpl.IsAssigned;
  begin
    if NOT Assigned(fValue) then
      RaiseException('{argument} cannot be NIL');
  end;


end.
