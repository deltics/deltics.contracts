
{$i test.inc}

  unit Tests.ForStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    StringContractsTests = class(TTest)
      procedure StringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
      procedure StringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
      procedure StringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
      procedure StringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure StringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
      procedure StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
      procedure StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
      procedure StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
      procedure StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
      procedure StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
    end;


implementation

  uses
    Deltics.Contracts;


  procedure StringContractsTests.StringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmpty;
  end;


  procedure StringContractsTests.StringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', '').IsNotEmpty;
  end;


  procedure StringContractsTests.StringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmptyOrWhitespace;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', '12345').IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', '').IsNotEmptyOrWhitespace;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #13#13).IsNotEmptyOrWhitespace;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #10#10).IsNotEmptyOrWhitespace;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
  begin
    Test.RaisesException(EArgumentException);

    Require('', '  ').IsNotEmptyOrWhitespace;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #9#9).IsNotEmptyOrWhitespace;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', #9#10#13 + ' ').IsNotEmptyOrWhitespace;
  end;



end.
