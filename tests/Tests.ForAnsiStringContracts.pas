
{$i test.inc}

  unit Tests.ForAnsiStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    AnsiStringContractsTests = class(TTest)
    {$ifdef UNICODE}
      procedure AnsiStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
      procedure AnsiStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
      procedure AnsiStringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
      procedure AnsiStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure AnsiStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
    {$else}
      procedure NoTestMethods;
    {$endif}
    end;



implementation

{$ifdef UNICODE}
  uses
    Deltics.Contracts;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmpty;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', '').IsNotEmpty;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', '').IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #13#13).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #10#10).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
  begin
    Test.RaisesException(EArgumentException);

    Require('', '  ').IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #9#9).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #9#10#13 + ' ').IsNotEmptyOrWhitespace;
  end;
{$else}
  procedure AnsiStringContractsTests.NoTestMethods;
  begin
    // For non-Unicode compilers, AnsiStringContracts are provided by StringContracts
    //  so there are no separate AnsiStringContracts and therefore nothing to test
    TestRun.NoTestsPerformed;
  end;
{$endif}

end.

