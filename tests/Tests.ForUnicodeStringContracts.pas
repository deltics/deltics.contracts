
{$i test.inc}

  unit Tests.ForUnicodeStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    UnicodeStringContractsTests = class(TTest)
      procedure UnicodeStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
      procedure UnicodeStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
      procedure UnicodeStringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
      procedure UnicodeStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure UnicodeStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
      procedure UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
      procedure UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
      procedure UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
      procedure UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
      procedure UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
    end;


implementation

  uses
    Deltics.Contracts;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmpty;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Require('test', '').IsNotEmpty;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Require('test', '').IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.Raises(EArgumentException);

    Require('test', #13#13).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.Raises(EArgumentException);

    Require('test', #10#10).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
  begin
    Test.Raises(EArgumentException);

    Require('', '  ').IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
  begin
    Test.Raises(EArgumentException);

    Require('test', #9#9).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
  begin
    Test.Raises(EArgumentException);

    Require('test', #9#10#13 + ' ').IsNotEmptyOrWhitespace;
  end;



end.

