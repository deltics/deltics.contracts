
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
    try
      Require('test', '12345').IsNotEmpty;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    try
      Require('test', '').IsNotEmpty;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    try
      Require('test', '12345').IsNotEmpty.GetLength(len);

      Test.AssertNoException;
      Test('GetActualLength').Assert(len).Equals(5);
    except
      Test.AssertNoException;
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    try
      Require('test', '12345').IsNotEmptyOrWhitespace;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    try
      Require('test', '12345').IsNotEmptyOrWhitespace.GetLength(len);

      Test.AssertNoException;
      Test('GetActualLen').Assert(len).Equals(5);
    except
      Test.AssertNoException;
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    try
      Require('test', '').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
  begin
    try
      Require('test', #13#13).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
  begin
    try
      Require('test', #10#10).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
  begin
    try
      Require('', '  ').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
  begin
    try
      Require('test', #9#9).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure StringContractsTests.StringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
  begin
    try
      Require('test', #9#10#13 + ' ').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;



end.
