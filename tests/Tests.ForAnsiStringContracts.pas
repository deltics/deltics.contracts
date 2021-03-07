
{$i test.inc}

  unit Tests.ForAnsiStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    AnsiStringContractsTests = class(TTest)
      procedure AnsiStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnAnsiEmptyString;
      procedure AnsiStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnAnsiEmptyString;
      procedure AnsiStringIsNotEmptyRaisesWhenArgumentIsAnAnsiEmptyString;
      procedure AnsiStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnAnsiEmptyWhitespaceString;
      procedure AnsiStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnAnsiEmptyWhitespaceString;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnAnsiEmptyString;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
    end;



implementation

  uses
    Deltics.Contracts,
    TestConsts;



  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnAnsiEmptyString;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', AnsiDigits).IsNotEmpty;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyRaisesWhenArgumentIsAnAnsiEmptyString;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', AnsiEmpty).IsNotEmpty;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnAnsiEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', AnsiDigits).IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnAnsiEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', AnsiDigits).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnAnsiEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', AnsiDigits).IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnAnsiEmptyString;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', AnsiEmpty).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', AnsiCRs).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', AnsiLFs).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', AnsiSpaces).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', AnsiTABs).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', AnsiWhitespace).IsNotEmptyOrWhitespace;
  end;




end.

