
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
    try
      Require('test', 10).IsGreaterThan(0);

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure IntegerContractsTests.IntegerIsGreaterThanRaisesExceptionWhenValueIsEqual;
  begin
    try
      Require('test', 10).IsGreaterThan(10);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure IntegerContractsTests.IntegerIsGreaterThanRaisesExceptionWhenValueIsLess;
  begin
    try
      Require('test', 10).IsGreaterThan(100);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringDoesNotRaiseExceptionWhenIndexIsValid;
  var
    i: integer;
    s: String;
  begin
    s := 'Not Empty';
    try
      for i := 1 to Length(s) do
        Require('test', i).IsValidIndexForString(s);

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringYieldsLengthWhenIndexIsValid;
  var
    i: integer;
    s: String;
    len: Integer;
  begin
    s := 'Not Empty';
    try
      for i := 1 to Length(s) do
      begin
        Require('test', i).IsValidIndexForString(s).GetLength(len);
        Test('GetActualLen').Assert(len).Equals(Length(s));
      end;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringRaisesExceptionWhenArgumentIsLargerThanLength;
  begin
    try
      Require('test', 6).IsValidIndexForString('12345');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringRaisesExceptionWhenArgumentIsLessThanOne;
  begin
    try
      Require('test', 0).IsValidIndexForString('12345');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForStringRaisesExceptionWhenStringIsEmpty;
  begin
    try
      Require('test', 0).IsValidIndexForString('');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


{$ifdef UNICODE}
  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringDoesNotRaiseExceptionWhenIndexIsValid;
  var
    i: integer;
    s: AnsiString;
  begin
    s := 'Not Empty';
    try
      for i := 1 to Length(s) do
        Require('test', i).IsValidIndexForString(s);

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringYieldsLengthWhenIndexIsValid;
  var
    i: integer;
    s: AnsiString;
    len: Integer;
  begin
    s := 'Not Empty';
    try
      for i := 1 to Length(s) do
      begin
        Require('test', i).IsValidIndexForString(s).GetLength(len);
        Test('GetActualLen').Assert(len).Equals(Length(s));
      end;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesExceptionWhenArgumentIsLargerThanLength;
  begin
    try
      Require('test', 6).IsValidIndexForString('12345');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesExceptionWhenArgumentIsLessThanOne;
  begin
    try
      Require('test', 0).IsValidIndexForString('12345');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForAnsiStringRaisesExceptionWhenStringIsEmpty;
  begin
    try
      Require('test', 0).IsValidIndexForString('');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;
{$endif}


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringDoesNotRaiseExceptionWhenIndexIsValid;
  var
    i: integer;
    s: WideString;
  begin
    s := 'Not Empty';
    try
      for i := 1 to Length(s) do
        Require('test', i).IsValidIndexForString(s);

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringYieldsLengthWhenIndexIsValid;
  var
    i: integer;
    s: WideString;
    len: Integer;
  begin
    s := 'Not Empty';
    try
      for i := 1 to Length(s) do
      begin
        Require('test', i).IsValidIndexForString(s).GetLength(len);
        Test('GetActualLen').Assert(len).Equals(Length(s));
      end;

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesExceptionWhenArgumentIsLargerThanLength;
  begin
    try
      Require('test', 6).IsValidIndexForString('12345');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesExceptionWhenArgumentIsLessThanOne;
  begin
    try
      Require('test', 0).IsValidIndexForString('12345');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure IntegerContractsTests.IntegerIsValidIndexForWideStringRaisesExceptionWhenStringIsEmpty;
  begin
    try
      Require('test', 0).IsValidIndexForString('');

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


end.
