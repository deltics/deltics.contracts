
{$i test.inc}

  unit Tests.ForPointerContracts;


interface

  uses
    Deltics.Smoketest;


  type
    PointerContractsTests = class(TTest)
      procedure IsAssignedDoesNotNotRaiseExceptionWhenValueIsAssigned;
      procedure IsAssignedRaisesExceptionWhenValueIsNIL;
    end;


implementation

  uses
    Deltics.Contracts;




{ PointerContractsTests }

  procedure PointerContractsTests.IsAssignedDoesNotNotRaiseExceptionWhenValueIsAssigned;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', @self).IsAssigned;
  end;


  procedure PointerContractsTests.IsAssignedRaisesExceptionWhenValueIsNIL;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', NIL).IsAssigned;
  end;



end.
