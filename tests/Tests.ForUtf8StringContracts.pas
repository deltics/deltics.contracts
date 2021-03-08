
{$i test.inc}

  unit Tests.ForUtf8StringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    Utf8StringContractsTests = class(TTest)
      procedure IsLongerThanRaisesExceptionWhenArgumentIsSameLength;
      procedure IsLongerThanRaisesExceptionWhenArgumentIsShorter;
      procedure IsLongerThanRaisesNoExceptionWhenArgumentIsLonger;
      procedure IsNotLongerThanRaisesExceptionWhenArgumentIsLonger;
      procedure IsNotLongerThanRaisesNoExceptionWhenArgumentIsShorterOrEqual;
      procedure Utf8StringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
      procedure Utf8StringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
      procedure Utf8StringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
      procedure Utf8StringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure Utf8StringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
      procedure Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
      procedure Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
      procedure Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
      procedure Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
      procedure Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
    end;


implementation

  uses
    Deltics.Contracts,
    TestConsts;



  procedure Utf8StringContractsTests.IsLongerThanRaisesExceptionWhenArgumentIsSameLength;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8Digits).IsLongerThan(Length(Utf8Digits));
  end;


  procedure Utf8StringContractsTests.IsLongerThanRaisesExceptionWhenArgumentIsShorter;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8Digits).IsLongerThan(Length(Utf8Digits) + 1);
  end;


  procedure Utf8StringContractsTests.IsLongerThanRaisesNoExceptionWhenArgumentIsLonger;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', Utf8Digits).IsLongerThan(Length(Utf8Digits) - 1);
  end;


  procedure Utf8StringContractsTests.IsNotLongerThanRaisesExceptionWhenArgumentIsLonger;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8Digits).IsNotLongerThan(Length(Utf8Digits) - 1);
  end;


  procedure Utf8StringContractsTests.IsNotLongerThanRaisesNoExceptionWhenArgumentIsShorterOrEqual;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', Utf8Digits).IsNotLongerThan(Length(Utf8Digits) + 1);
    Contract.Requires('test', Utf8Digits).IsNotLongerThan(Length(Utf8Digits));
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', Utf8Digits).IsNotEmpty;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8Empty).IsNotEmpty;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', Utf8Digits).IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', Utf8Digits).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', Utf8Digits).IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8Empty).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8CRs).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8LFs).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8Spaces).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8TABs).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', Utf8Whitespace).IsNotEmptyOrWhitespace;
  end;



end.

