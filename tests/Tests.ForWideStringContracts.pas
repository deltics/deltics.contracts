
{$i test.inc}

  unit Tests.ForWideStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    WideStringContractsTests = class(TTest)
      procedure WideStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
      procedure WideStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
      procedure WideStringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
      procedure WideStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure WideStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
    end;


implementation

  uses
    Deltics.Contracts;


  procedure WideStringContractsTests.WideStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmpty;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', '').IsNotEmpty;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', '').IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #13#13).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #10#10).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
  begin
    Test.RaisesException(EArgumentException);

    Require('', '  ').IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #9#9).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #9#10#13 + ' ').IsNotEmptyOrWhitespace;
  end;



end.

