
{$APPTYPE CONSOLE}

program test;

  uses
  Deltics.Smoketest,
  Deltics.Contracts in '..\src\Deltics.Contracts.pas';

type
    ContractTests = class(TTest)
      procedure RequireMethodDoesNothingWhenArgumentIsTRUE;
      procedure RequireMethodRaisesEArgumentExceptionWhenArgumentIsFALSE;
      procedure RequireAssignedDoesNothingWhenArgumentIsNotNIL;
      procedure RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILObject;
      procedure RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILInterface;
      procedure RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILEvent;
      procedure RequireNotEmptyDoesNothingWhenArgumentIsNotAnEmptyString;
      procedure RequireNotEmptyReturnsLengthAndDoesNothingWhenArgumentIsNotAnEmptyString;
      procedure RequireNotEmptyRaisesEArgumentExceptionWhenArgumentIsAnEmptyString;
      procedure RequireNotEmptyReturnsLengthRaisesEArgumentExceptionWhenArgumentIsAnEmptyString;
      procedure RequireNotEmptyDoesNothingWhenArgumentIsNotAnEmptyAnsiString;
      procedure RequireNotEmptyReturnsLengthAndDoesNothingWhenArgumentIsNotAnEmptyAnsiString;
      procedure RequireNotEmptyRaisesEArgumentExceptionWhenArgumentIsAnEmptyAnsiString;
      procedure RequireNotEmptyReturnsLengthRaisesEArgumentExceptionWhenArgumentIsAnEmptyAnsiString;
      procedure RequireNotEmptyDoesNothingWhenArgumentIsNotAnEmptyWideString;
      procedure RequireNotEmptyReturnsLengthAndDoesNothingWhenArgumentIsNotAnEmptyWideString;
      procedure RequireNotEmptyRaisesEArgumentExceptionWhenArgumentIsAnEmptyWideString;
      procedure RequireNotEmptyReturnsLengthRaisesEArgumentExceptionWhenArgumentIsAnEmptyWideString;
      procedure RequireValidIndexForStringDoesNothingWhenIndexIsValid;
      procedure RequireValidIndexForStringRaisesEArgumentExceptionWhenArgumentIsLessThanOne;
      procedure RequireValidIndexForStringRaisesEArgumentExceptionWhenArgumentIsLargerThanLength;
      procedure RequireValidIndexForStringRaisesEArgumentExceptionWhenStringIsEmpty;
      procedure RequireValidIndexForAnsiStringDoesNothingWhenIndexIsValid;
      procedure RequireValidIndexForAnsiStringRaisesEArgumentExceptionWhenArgumentIsLessThanOne;
      procedure RequireValidIndexForAnsiStringRaisesEArgumentExceptionWhenArgumentIsLargerThanLength;
      procedure RequireValidIndexForAnsiStringRaisesEArgumentExceptionWhenAnsiStringIsEmpty;
      procedure RequireValidIndexForWideStringDoesNothingWhenIndexIsValid;
      procedure RequireValidIndexForWideStringRaisesEArgumentExceptionWhenArgumentIsLessThanOne;
      procedure RequireValidIndexForWideStringRaisesEArgumentExceptionWhenArgumentIsLargerThanLength;
      procedure RequireValidIndexForWideStringRaisesEArgumentExceptionWhenWideStringIsEmpty;
    end;


{ ContractTests }

  procedure ContractTests.RequireMethodDoesNothingWhenArgumentIsTRUE;
  begin
    try
      Require(TRUE);
      Test.AssertNoException;

    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireMethodRaisesEArgumentExceptionWhenArgumentIsFALSE;
  begin
    try
      Require(FALSE);
      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireAssignedDoesNothingWhenArgumentIsNotNIL;
  begin
    try
      Require.Assigned(self);
      Test.AssertNoException;

    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILObject;
  var
    o: TObject;
  begin
    try
      o := NIL;

      Require.Argument('o').Assigned(o);
      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILInterface;
  var
    i: IUnknown;
  begin
    try
      i := NIL;

      Require.Assigned(i);
      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireAssignedRaisesEArgumentExceptionWhenArgumentIsNILEvent;
  var
    e: procedure of object;
  begin
    try
      e := NIL;

      Require.Assigned(e);
      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireNotEmptyDoesNothingWhenArgumentIsNotAnEmptyString;
  var
    s: String;
  begin
    try
      s := 'Not empty';

      Require.NotEmpty(s);

      Test.AssertNoException;

    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireNotEmptyRaisesEArgumentExceptionWhenArgumentIsAnEmptyString;
  var
    s: String;
  begin
    try
      s := '';

      Require.NotEmpty(s);

      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireNotEmptyReturnsLengthAndDoesNothingWhenArgumentIsNotAnEmptyString;
  var
    s: String;
    len: Integer;
  begin
    try
      s := 'Not empty';

      Require.NotEmpty(s, len);

      Test.AssertNoException;
      Test('Length of non-empty string returned in var parameter').Assert(len).Equals(Length(s));

    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireNotEmptyReturnsLengthRaisesEArgumentExceptionWhenArgumentIsAnEmptyString;
  var
    s: String;
    len: Integer;
  begin
    try
      s   := '';
      len := 1;

      Require.NotEmpty(s, len);

      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
      Test('Length of empty string returned in var parameter is 0 (zero)').Assert(len).Equals(0);
    end;
  end;



  procedure ContractTests.RequireNotEmptyDoesNothingWhenArgumentIsNotAnEmptyAnsiString;
  var
    s: AnsiString;
  begin
    try
      s := 'Not empty';

      Require.NotEmpty(s);

      Test.AssertNoException;

    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireNotEmptyRaisesEArgumentExceptionWhenArgumentIsAnEmptyAnsiString;
  var
    s: AnsiString;
  begin
    try
      s := '';

      Require.NotEmpty(s);

      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireNotEmptyReturnsLengthAndDoesNothingWhenArgumentIsNotAnEmptyAnsiString;
  var
    s: AnsiString;
    len: Integer;
  begin
    try
      s := 'Not empty';

      Require.NotEmpty(s, len);

      Test.AssertNoException;
      Test('Length of non-empty string returned in var parameter').Assert(len).Equals(Length(s));

    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireNotEmptyReturnsLengthRaisesEArgumentExceptionWhenArgumentIsAnEmptyAnsiString;
  var
    s: AnsiString;
    len: Integer;
  begin
    try
      s   := '';
      len := 1;

      Require.NotEmpty(s, len);

      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
      Test('Length of empty string returned in var parameter is 0 (zero)').Assert(len).Equals(0);
    end;
  end;



  procedure ContractTests.RequireNotEmptyDoesNothingWhenArgumentIsNotAnEmptyWideString;
  var
    s: WideString;
  begin
    try
      s := 'Not empty';

      Require.NotEmpty(s);

      Test.AssertNoException;

    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireNotEmptyRaisesEArgumentExceptionWhenArgumentIsAnEmptyWideString;
  var
    s: WideString;
  begin
    try
      s := '';

      Require.NotEmpty(s);

      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireNotEmptyReturnsLengthAndDoesNothingWhenArgumentIsNotAnEmptyWideString;
  var
    s: WideString;
    len: Integer;
  begin
    try
      s := 'Not empty';

      Require.NotEmpty(s, len);

      Test.AssertNoException;
      Test('Length of non-empty string returned in var parameter').Assert(len).Equals(Length(s));

    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireNotEmptyReturnsLengthRaisesEArgumentExceptionWhenArgumentIsAnEmptyWideString;
  var
    s: WideString;
    len: Integer;
  begin
    try
      s   := '';
      len := 1;

      Require.NotEmpty(s, len);

      Test.AssertException(EArgumentException);

    except
      Test.AssertException(EArgumentException);
      Test('Length of empty string returned in var parameter is 0 (zero)').Assert(len).Equals(0);
    end;
  end;


  procedure ContractTests.RequireValidIndexForStringDoesNothingWhenIndexIsValid;
  var
    i: Integer;
    s: String;
  begin
    try
      s := 'Not empty';
      for i := 1 to Length(s) do
        Require.ValidIndexForString(s, i);

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireValidIndexForStringRaisesEArgumentExceptionWhenArgumentIsLargerThanLength;
  var
    i: Integer;
    s: String;
  begin
    try
      i := 20;
      s := 'Not empty';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireValidIndexForStringRaisesEArgumentExceptionWhenArgumentIsLessThanOne;
  var
    i: Integer;
    s: String;
  begin
    try
      i := 0;
      s := 'Not empty';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireValidIndexForStringRaisesEArgumentExceptionWhenStringIsEmpty;
  var
    i: Integer;
    s: String;
  begin
    try
      i := 1;
      s := '';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireValidIndexForAnsiStringDoesNothingWhenIndexIsValid;
  var
    i: Integer;
    s: AnsiString;
  begin
    try
      s := 'Not empty';
      for i := 1 to Length(s) do
        Require.ValidIndexForString(s, i);

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireValidIndexForAnsiStringRaisesEArgumentExceptionWhenArgumentIsLargerThanLength;
  var
    i: Integer;
    s: AnsiString;
  begin
    try
      i := 20;
      s := 'Not empty';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireValidIndexForAnsiStringRaisesEArgumentExceptionWhenArgumentIsLessThanOne;
  var
    i: Integer;
    s: AnsiString;
  begin
    try
      i := 0;
      s := 'Not empty';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireValidIndexForAnsiStringRaisesEArgumentExceptionWhenAnsiStringIsEmpty;
  var
    i: Integer;
    s: AnsiString;
  begin
    try
      i := 1;
      s := '';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireValidIndexForWideStringDoesNothingWhenIndexIsValid;
  var
    i: Integer;
    s: WideString;
  begin
    try
      s := 'Not empty';
      for i := 1 to Length(s) do
        Require.ValidIndexForString(s, i);

      Test.AssertNoException;
    except
      Test.AssertNoException;
    end;
  end;


  procedure ContractTests.RequireValidIndexForWideStringRaisesEArgumentExceptionWhenArgumentIsLargerThanLength;
  var
    i: Integer;
    s: WideString;
  begin
    try
      i := 20;
      s := 'Not empty';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireValidIndexForWideStringRaisesEArgumentExceptionWhenArgumentIsLessThanOne;
  var
    i: Integer;
    s: WideString;
  begin
    try
      i := 0;
      s := 'Not empty';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


  procedure ContractTests.RequireValidIndexForWideStringRaisesEArgumentExceptionWhenWideStringIsEmpty;
  var
    i: Integer;
    s: WideString;
  begin
    try
      i := 1;
      s := '';

      Require.ValidIndexForString(s, i);

      Test.AssertException(EArgumentException);
    except
      Test.AssertException(EArgumentException);
    end;
  end;


begin
  TestRun.Test(ContractTests);
end.
