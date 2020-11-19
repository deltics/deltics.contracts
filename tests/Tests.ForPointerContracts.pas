
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
    try
      Require('test', @self).IsAssigned;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure PointerContractsTests.IsAssignedRaisesExceptionWhenValueIsNIL;
  begin
    try
      Require('test', NIL).IsAssigned;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;



end.
