
{$i test.inc}

  unit Tests.ForIntegerContracts;


interface

  uses
    Deltics.Smoketest;


  type
    IntegerContractsTests = class(TTest)
      procedure IntegerIsGreaterThanDoesNotRaiseExceptionWhenValueIsGreaterThan;
      procedure IntegerIsGreaterThanRaisesExceptionWhenValueIsEqual;
      procedure IntegerIsGreaterThanRaisesExceptionWhenValueIsLess;
      procedure IntegerIsValidIndexForStringDoesNotRaiseExceptionWhenIndexIsValid;
      procedure IntegerIsValidIndexForStringYieldsLengthWhenIndexIsValid;
      procedure IntegerIsValidIndexForStringRaisesExceptionWhenArgumentIsLessThanOne;
      procedure IntegerIsValidIndexForStringRaisesExceptionWhenArgumentIsLargerThanLength;
      procedure IntegerIsValidIndexForStringRaisesExceptionWhenStringIsEmpty;
    {$ifdef UNICODE}
      procedure IntegerIsValidIndexForAnsiStringDoesNotRaiseExceptionWhenIndexIsValid;
      procedure IntegerIsValidIndexForAnsiStringYieldsLengthWhenIndexIsValid;
      procedure IntegerIsValidIndexForAnsiStringRaisesExceptionWhenArgumentIsLessThanOne;
      procedure IntegerIsValidIndexForAnsiStringRaisesExceptionWhenArgumentIsLargerThanLength;
      procedure IntegerIsValidIndexForAnsiStringRaisesExceptionWhenStringIsEmpty;
    {$endif}
      procedure IntegerIsValidIndexForWideStringDoesNotRaiseExceptionWhenIndexIsValid;
      procedure IntegerIsValidIndexForWideStringYieldsLengthWhenIndexIsValid;
      procedure IntegerIsValidIndexForWideStringRaisesExceptionWhenArgumentIsLessThanOne;
      procedure IntegerIsValidIndexForWideStringRaisesExceptionWhenArgumentIsLargerThanLength;
      procedure IntegerIsValidIndexForWideStringRaisesExceptionWhenStringIsEmpty;
    end;


implementation

  uses
    Deltics.Contracts;


  procedure IntegerContractsTests.IntegerIsGreaterThanDoesNotRaiseExceptionWhenValueIsGreaterThan;
  begin
    Test.RaisesNoException;

    Require('test', 10).IsGreaterThan(0);
  end;


  procedure IntegerContractsTests.IntegerIsGreaterThanRaisesExceptionWhenValueIsEqual;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 10).IsGreaterThan(10);
  end;


  procedure IntegerContractsTests.IntegerIsGreaterThanRaisesExceptionWhenValueIsLess;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 10).IsGreaterThan(100);
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringDoesNotRaiseExceptionWhenIndexIsValid;
  var
    i: integer;
    s: String;
  begin
    Test.RaisesNoException;

    s := 'Not Empty';
    for i := 1 to Length(s) do
      Require('test', i).IsValidIndexForString(s);
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringYieldsLengthWhenIndexIsValid;
  var
    i: integer;
    s: String;
    len: Integer;
  begin
    Test.RaisesNoException;

    s := 'Not Empty';
    for i := 1 to Length(s) do
    begin
      Require('test', i).IsValidIndexForString(s).GetLength(len);
      Test('GetActualLen').Assert(len).Equals(Length(s));
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringRaisesExceptionWhenArgumentIsLargerThanLength;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 6).IsValidIndexForString('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringRaisesExceptionWhenArgumentIsLessThanOne;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 0).IsValidIndexForString('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringRaisesExceptionWhenStringIsEmpty;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 0).IsValidIndexForString('');
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
      Require('test', i).IsValidIndexForString(s);
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
      Require('test', i).IsValidIndexForString(s).GetLength(len);
      Test('GetActualLen').Assert(len).Equals(Length(s));
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesExceptionWhenArgumentIsLargerThanLength;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 6).IsValidIndexForString('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesExceptionWhenArgumentIsLessThanOne;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 0).IsValidIndexForString('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesExceptionWhenStringIsEmpty;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 0).IsValidIndexForString('');
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
      Require('test', i).IsValidIndexForString(s);
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
      Require('test', i).IsValidIndexForString(s).GetLength(len);
      Test('GetActualLen').Assert(len).Equals(Length(s));
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesExceptionWhenArgumentIsLargerThanLength;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 6).IsValidIndexForString('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesExceptionWhenArgumentIsLessThanOne;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 0).IsValidIndexForString('12345');
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesExceptionWhenStringIsEmpty;
  begin
    Test.RaisesException(EArgumentException);

    Require('test', 0).IsValidIndexForString('');
  end;


end.
