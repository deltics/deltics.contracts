
{$i test.inc}

  unit Tests.ForWideStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    WideStringContractsTests = class(TTest)
      procedure IsLongerThanRaisesExceptionWhenArgumentIsSameLength;
      procedure IsLongerThanRaisesExceptionWhenArgumentIsShorter;
      procedure IsLongerThanRaisesNoExceptionWhenArgumentIsLonger;
      procedure IsNotLongerThanRaisesExceptionWhenArgumentIsLonger;
      procedure IsNotLongerThanRaisesNoExceptionWhenArgumentIsShorterOrEqual;
      procedure WideStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
      procedure WideStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
      procedure WideStringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
      procedure WideStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure WideStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
      procedure WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
    end;


implementation

  uses
    Deltics.Contracts,
    TestConsts;



  procedure WideStringContractsTests.IsLongerThanRaisesExceptionWhenArgumentIsSameLength;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideDigits).IsLongerThan(Length(WideDigits));
  end;


  procedure WideStringContractsTests.IsLongerThanRaisesExceptionWhenArgumentIsShorter;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideDigits).IsLongerThan(Length(WideDigits) + 1);
  end;


  procedure WideStringContractsTests.IsLongerThanRaisesNoExceptionWhenArgumentIsLonger;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideDigits).IsLongerThan(Length(WideDigits) - 1);
  end;


  procedure WideStringContractsTests.IsNotLongerThanRaisesExceptionWhenArgumentIsLonger;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideDigits).IsNotLongerThan(Length(WideDigits) - 1);
  end;


  procedure WideStringContractsTests.IsNotLongerThanRaisesNoExceptionWhenArgumentIsShorterOrEqual;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideDigits).IsNotLongerThan(Length(WideDigits) + 1);
    Contract.Requires('test', WideDigits).IsNotLongerThan(Length(WideDigits));
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideDigits).IsNotEmpty;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideEmpty).IsNotEmpty;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideDigits).IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideDigits).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideDigits).IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideEmpty).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideCRs).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideLFs).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideSpaces).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideTABs).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideWhitespace).IsNotEmptyOrWhitespace;
  end;



end.

