
{$i test.inc}

  unit Tests.ForUtf8StringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    Utf8StringContractsTests = class(TTest)
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
    Deltics.Contracts;

  const
    Empty       : Utf8String = '';
    Digits      : Utf8String = '12345';
    Spaces      : Utf8String = '  ';
    CRs         : Utf8String = #13#13;
    LFs         : Utf8String = #10#10;
    TABs        : Utf8String = #9#9;
    Whitespace  : Utf8String = #9#10#13 + ' ';



  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmpty;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Require('test', Empty).IsNotEmpty;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Require('test', Empty).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.Raises(EArgumentException);

    Require('test', CRs).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.Raises(EArgumentException);

    Require('test', LFs).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
  begin
    Test.Raises(EArgumentException);

    Require('test', Spaces).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
  begin
    Test.Raises(EArgumentException);

    Require('test', TABs).IsNotEmptyOrWhitespace;
  end;


  procedure Utf8StringContractsTests.Utf8StringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
  begin
    Test.Raises(EArgumentException);

    Require('test', Whitespace).IsNotEmptyOrWhitespace;
  end;



end.
