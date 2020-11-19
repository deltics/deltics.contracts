
  unit Tests.ForAnsiStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    AnsiStringContractsTests = class(TTest)
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
    end;


implementation

  uses
    Deltics.Contracts;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    try
      Require('test', '12345').IsNotEmpty;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    try
      Require('test', '').IsNotEmpty;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
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


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    try
      Require('test', '12345').IsNotEmptyOrWhitespace;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
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


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    try
      Require('test', '').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
  begin
    try
      Require('test', #13#13).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
  begin
    try
      Require('test', #10#10).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
  begin
    try
      Require('', '  ').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
  begin
    try
      Require('test', #9#9).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
  begin
    try
      Require('test', #9#10#13 + ' ').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;



end.

