
{$i deltics.inc}

program test;

  uses
  Deltics.Smoketest,
  Deltics.Contracts in '..\src\Deltics.Contracts.pas',
  Deltics.Contracts.Interfaces in '..\src\Deltics.Contracts.Interfaces.pas',
  Deltics.Contracts.Base in '..\src\Deltics.Contracts.Base.pas',
  Deltics.Contracts.ForChars in '..\src\Deltics.Contracts.ForChars.pas',
  Deltics.Contracts.ForIntegers in '..\src\Deltics.Contracts.ForIntegers.pas',
  Deltics.Contracts.ForPointers in '..\src\Deltics.Contracts.ForPointers.pas',
  Deltics.Contracts.ForStrings in '..\src\Deltics.Contracts.ForStrings.pas',
  Deltics.Contracts.ForAnsiStrings in '..\src\Deltics.Contracts.ForAnsiStrings.pas',
  Deltics.Contracts.ForWideStrings in '..\src\Deltics.Contracts.ForWideStrings.pas',
  Tests.ForIntegerContracts in 'Tests.ForIntegerContracts.pas',
  Tests.ForPointerContracts in 'Tests.ForPointerContracts.pas',
  Tests.ForStringContracts in 'Tests.ForStringContracts.pas',
  Tests.ForAnsiStringContracts in 'Tests.ForAnsiStringContracts.pas',
  Tests.ForWideStringContracts in 'Tests.ForWideStringContracts.pas';

begin
  TestRun.Test(IntegerContractsTests);
  TestRun.Test(PointerContractsTests);
  TestRun.Test(StringContractsTests);
  TestRun.Test(AnsiStringContractsTests);
  TestRun.Test(WideStringContractsTests);
end.
