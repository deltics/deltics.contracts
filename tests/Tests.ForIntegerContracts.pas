
{$i test.inc}

  unit Tests.ForIntegerContracts;


interface

  uses
    Deltics.Smoketest;


  type
    IntegerContractsTests = class(TTest)
      procedure IntegerIsGreaterThanDoesNotRaiseExceptionWhenValueIsGreaterThan;
      procedure IntegerIsGreaterThanRaisesWhenValueIsEqual;
      procedure IntegerIsGreaterThanRaisesWhenValueIsLess;
      procedure IntegerIsValidIndexForDoesNotRaiseExceptionWhenIndexIsValid;
      procedure IntegerIsValidIndexForYieldsLengthWhenIndexIsValid;
      procedure IntegerIsValidIndexForRaisesWhenArgumentIsLessThanOne;
      procedure IntegerIsValidIndexForRaisesWhenArgumentIsLargerThanLength;
      procedure IntegerIsValidIndexForRaisesWhenStringIsEmpty;
    {$ifdef UNICODE}
      procedure IntegerIsValidIndexForAnsiStringDoesNotRaiseExceptionWhenIndexIsValid;
      procedure IntegerIsValidIndexForAnsiStringYieldsLengthWhenIndexIsValid;
      procedure IntegerIsValidIndexForAnsiStringRaisesWhenArgumentIsLessThanOne;
      procedure IntegerIsValidIndexForAnsiStringRaisesWhenArgumentIsLargerThanLength;
      procedure IntegerIsValidIndexForAnsiStringRaisesWhenStringIsEmpty;
    {$endif}
      procedure IntegerIsValidIndexForWideStringDoesNotRaiseExceptionWhenIndexIsValid;
      procedure IntegerIsValidIndexForWideStringYieldsLengthWhenIndexIsValid;
      procedure IntegerIsValidIndexForWideStringRaisesWhenArgumentIsLessThanOne;
      procedure IntegerIsValidIndexForWideStringRaisesWhenArgumentIsLargerThanLength;
      procedure IntegerIsValidIndexForWideStringRaisesWhenStringIsEmpty;
    end;


implementation

  uses
    Deltics.Contracts;


  procedure IntegerContractsTests.IntegerIsGreaterThanDoesNotRaiseExceptionWhenValueIsGreaterThan;
  begin
    Test.RaisesNoException;

    Require('test', 10).IsGreaterThan(0);
  end;


  procedure IntegerContractsTests.IntegerIsGreaterThanRaisesWhenValueIsEqual;
  begin
    Test.Raises(EArgumentException);

    Require('test', 10).IsGreaterThan(10);
  end;


  procedure IntegerContractsTests.IntegerIsGreaterThanRaisesWhenValueIsLess;
  begin
    Test.Raises(EArgumentException);

    Require('test', 10).IsGreaterThan(100);
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForDoesNotRaiseExceptionWhenIndexIsValid;
  var
    i: integer;
    s: String;
  begin
    Test.RaisesNoException;

    s := 'Not Empty';
    for i := 1 to Length(s) do
      Require('test', i).IsValidIndexFor(s);
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForYieldsLengthWhenIndexIsValid;
  var
    i: integer;
    s: String;
    len: Integer;
  begin
    Test.RaisesNoException;

    s := 'Not Empty';
    for i := 1 to Length(s) do
    begin
      Require('test', i).IsValidIndexFor(s).GetLength(len);
      Test('GetActualLen').Assert(len).Equals(Length(s));
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForRaisesWhenArgumentIsLargerThanLength;
  begin
    Test.Raises(EArgumentException);

    Require('test', 6).IsValidIndexFor('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForRaisesWhenArgumentIsLessThanOne;
  begin
    Test.Raises(EArgumentException);

    Require('test', 0).IsValidIndexFor('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForRaisesWhenStringIsEmpty;
  begin
    Test.Raises(EArgumentException);

    Require('test', 0).IsValidIndexFor('');
  end;


{$ifdef UNICODE}
  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringDoesNotRaiseExceptionWhenIndexIsValid;
  var
    i: integer;
    s: AnsiString;
  begin
    Test.RaisesNoException;

    s := 'Not Empty';
    for i := 1 to Length(s) do
      Require('test', i).IsValidIndexFor(s);
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringYieldsLengthWhenIndexIsValid;
  var
    i: integer;
    s: AnsiString;
    len: Integer;
  begin
    Test.RaisesNoException;

    s := 'Not Empty';
    for i := 1 to Length(s) do
    begin
      Require('test', i).IsValidIndexFor(s).GetLength(len);
      Test('GetActualLen').Assert(len).Equals(Length(s));
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesWhenArgumentIsLargerThanLength;
  begin
    Test.Raises(EArgumentException);

    Require('test', 6).IsValidIndexFor('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesWhenArgumentIsLessThanOne;
  begin
    Test.Raises(EArgumentException);

    Require('test', 0).IsValidIndexFor('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesWhenStringIsEmpty;
  begin
    Test.Raises(EArgumentException);

    Require('test', 0).IsValidIndexFor('');
  end;
{$endif}


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringDoesNotRaiseExceptionWhenIndexIsValid;
  var
    i: integer;
    s: WideString;
  begin
    Test.RaisesNoException;

    s := 'Not Empty';
    for i := 1 to Length(s) do
      Require('test', i).IsValidIndexFor(s);
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringYieldsLengthWhenIndexIsValid;
  var
    i: integer;
    s: WideString;
    len: Integer;
  begin
    Test.RaisesNoException;

    s := 'Not Empty';
    for i := 1 to Length(s) do
    begin
      Require('test', i).IsValidIndexFor(s).GetLength(len);
      Test('GetActualLen').Assert(len).Equals(Length(s));
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesWhenArgumentIsLargerThanLength;
  begin
    Test.Raises(EArgumentException);

    Require('test', 6).IsValidIndexFor('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesWhenArgumentIsLessThanOne;
  begin
    Test.Raises(EArgumentException);

    Require('test', 0).IsValidIndexFor('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesWhenStringIsEmpty;
  begin
    Test.Raises(EArgumentException);

    Require('test', 0).IsValidIndexFor('');
  end;


end.
