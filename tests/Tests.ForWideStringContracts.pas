
{$i test.inc}

  unit Tests.ForWideStringContracts;

interface

  uses
    Deltics.Smoketest;


  type
    WideStringContractsTests = class(TTest)
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
    Deltics.StringTypes;


  const
    Empty       : WideString = '';
    Digits      : WideString = '12345';
    Spaces      : WideString = '  ';
    CRs         : WideString = #13#13;
    LFs         : WideString = #10#10;
    TABs        : WideString = #9#9;
    Whitespace  : WideString = #9#10#13 + ' ';



  procedure WideStringContractsTests.WideStringIsNotEmptyDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyString;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmpty;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Require('test', Empty).IsNotEmpty;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyYieldsLengthWhenArgumentIsNotAnEmptyString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmpty.GetLength(len);

    Test('GetActualLength').Assert(len).Equals(5);
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceDoesNotRaiseExceptionWhenArgumentIsNotAnEmptyWhitespaceString;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceYieldsLengthWhenArgumentIsNotAnEmptyWhitespaceString;
  var
    len: Integer;
  begin
    Test.RaisesNoException;

    Require('test', Digits).IsNotEmptyOrWhitespace.GetLength(len);

    Test('GetActualLen').Assert(len).Equals(5);
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentIsAnEmptyString;
  begin
    Test.Raises(EArgumentException);

    Require('test', Empty).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyCarriageReturns;
  begin
    Test.Raises(EArgumentException);

    Require('test', CRs).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyLineFeeds;
  begin
    Test.Raises(EArgumentException);

    Require('test', LFs).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlySpaces;
  begin
    Test.Raises(EArgumentException);

    Require('test', Spaces).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyTabs;
  begin
    Test.Raises(EArgumentException);

    Require('test', TABs).IsNotEmptyOrWhitespace;
  end;


  procedure WideStringContractsTests.WideStringIsNotEmptyOrWhitespaceRaisesWhenArgumentContainsOnlyWhitespace;
  begin
    Test.Raises(EArgumentException);

    Require('test', Whitespace).IsNotEmptyOrWhitespace;
  end;



end.

