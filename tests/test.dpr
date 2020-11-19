
{$APPTYPE CONSOLE}

program test;

  uses
  Deltics.Smoketest,
  Deltics.Contracts in '..\src\Deltics.Contracts.pas',
  Deltics.Contracts.Interfaces in '..\src\Deltics.Contracts.Interfaces.pas',
  Deltics.Contracts.ForIntegers in '..\src\Deltics.Contracts.ForIntegers.pas',
  Deltics.Contracts.ForStrings in '..\src\Deltics.Contracts.ForStrings.pas',
  {$ifdef UNICODE}
  Deltics.Contracts.ForAnsiStrings in '..\src\Deltics.Contracts.ForAnsiStrings.pas',
  {$endif }
  Deltics.Contracts.ForWideStrings in '..\src\Deltics.Contracts.ForWideStrings.pas',
  Deltics.Contracts.Base in '..\src\Deltics.Contracts.Base.pas',
  Tests.ForStringContracts in 'Tests.ForStringContracts.pas',
  Tests.ForIntegerContracts in 'Tests.ForIntegerContracts.pas',
  Tests.ForAnsiStringContracts in 'Tests.ForAnsiStringContracts.pas',
  Deltics.Contracts.ForChars in '..\src\Deltics.Contracts.ForChars.pas',
  Deltics.Contracts.ForPointers in '..\src\Deltics.Contracts.ForPointers.pas',
  Tests.ForPointerContracts in 'Tests.ForPointerContracts.pas';

type
    ContractTests = class(TTest)
//      procedure RequireAssignedDoesNothingWhenArgumentIsNotNIL;
//      procedure RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILObject;
//      procedure RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILInterface;
//      procedure RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILEvent;
    end;




begin
  TestRun.Test(IntegerContractsTests);
  TestRun.Test(StringContractsTests);
  TestRun.Test(AnsiStringContractsTests);
end.
