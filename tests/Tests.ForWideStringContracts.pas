
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
    try
      Require('test', '12345').IsNotEmpty;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    try
      Require('test', '').IsNotEmpty;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
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


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    try
      Require('test', '12345').IsNotEmptyOrWhitespace;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
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


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentIsAnEmptyString;
  begin
    try
      Require('test', '').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyCarriageReturns;
  begin
    try
      Require('test', #13#13).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyLineFeeds;
  begin
    try
      Require('test', #10#10).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlySpaces;
  begin
    try
      Require('', '  ').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyTabs;
  begin
    try
      Require('test', #9#9).IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesExceptionWhenArgumentContainsOnlyWhitespace;
  begin
    try
      Require('test', #9#10#13 + ' ').IsNotEmptyOrWhitespace;

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;



end.

