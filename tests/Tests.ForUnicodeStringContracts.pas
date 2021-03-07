
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
    Deltics.Contracts,
    TestConsts;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', UnicodeDigits).IsNotEmpty;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', UnicodeEmpty).IsNotEmpty;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', UnicodeDigits).IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', UnicodeDigits).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', UnicodeDigits).IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', UnicodeEmpty).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', UnicodeCRs).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', UnicodeLFs).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', UnicodeSpaces).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', UnicodeTABs).IsNotEmptyOrWhitespace;
  end;


  procedure UnicodeStringContractsTests.UnicodeStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', UnicodeWhitespace).IsNotEmptyOrWhitespace;
  end;



end.

