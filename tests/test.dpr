
{$i deltics.inc}

program test;

uses
  Deltics.Smoketest,
  Deltics.Contracts in '..\src\Deltics.Contracts.pas',
  Deltics.Contracts.Base in '..\src\Deltics.Contracts.Base.pas',
  Deltics.Contracts.Interfaces in '..\src\Deltics.Contracts.Interfaces.pas',
  Deltics.Contracts.ForChars in '..\src\Deltics.Contracts.ForChars.pas',
  Deltics.Contracts.ForIntegers in '..\src\Deltics.Contracts.ForIntegers.pas',
  Deltics.Contracts.ForPointers in '..\src\Deltics.Contracts.ForPointers.pas',
  Deltics.Contracts.ForAnsiStrings in '..\src\Deltics.Contracts.ForAnsiStrings.pas',
  Deltics.Contracts.ForUnicodeStrings in '..\src\Deltics.Contracts.ForUnicodeStrings.pas',
  Deltics.Contracts.ForUtf8Strings in '..\src\Deltics.Contracts.ForUtf8Strings.pas',
  Deltics.Contracts.ForWideStrings in '..\src\Deltics.Contracts.ForWideStrings.pas',
  TestConsts in 'TestConsts.pas',
  Tests.ForIntegerContracts in 'Tests.ForIntegerContracts.pas',
  Tests.ForPointerContracts in 'Tests.ForPointerContracts.pas',
  Tests.ForCharContracts in 'Tests.ForCharContracts.pas',
  Tests.ForAnsiStringContracts in 'Tests.ForAnsiStringContracts.pas',
  Tests.ForUnicodeStringContracts in 'Tests.ForUnicodeStringContracts.pas',
  Tests.ForUtf8StringContracts in 'Tests.ForUtf8StringContracts.pas',
  Tests.ForWideStringContracts in 'Tests.ForWideStringContracts.pas';

begin
  TestRun.Test(IntegerContractsTests);
  TestRun.Test(PointerContractsTests);
  TestRun.Test(CharContractTests);
  TestRun.Test(AnsiStringContractsTests);
  TestRun.Test(UnicodeStringContractsTests);
  TestRun.Test(Utf8StringContractsTests);
  TestRun.Test(WideStringContractsTests);
end.
