
{$i test.inc}

  unit Tests.ForAnsiStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    AnsiStringContractsTests = class(TTest)
      procedure AnsiStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
      procedure AnsiStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
      procedure AnsiStringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
      procedure AnsiStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure AnsiStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
      procedure AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
    end;



implementation

  uses
    Deltics.Contracts;


  const
    Empty       : AnsiString = '';
    Digits      : AnsiString = '12345';
    Spaces      : AnsiString = '  ';
    CRs         : AnsiString = #13#13;
    LFs         : AnsiString = #10#10;
    TABs        : AnsiString = #9#9;
    Whitespace  : AnsiString = #9#10#13 + ' ';



  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmpty;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Require('test', Empty).IsNotEmpty;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Require('test', Empty).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.Raises(EArgumentException);

    Require('test', CRs).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.Raises(EArgumentException);

    Require('test', LFs).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
  begin
    Test.Raises(EArgumentException);

    Require('test', Spaces).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
  begin
    Test.Raises(EArgumentException);

    Require('test', TABs).IsNotEmptyOrWhitespace;
  end;


  procedure AnsiStringContractsTests.AnsiStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
  begin
    Test.Raises(EArgumentException);

    Require('test', Whitespace).IsNotEmptyOrWhitespace;
  end;




end.

