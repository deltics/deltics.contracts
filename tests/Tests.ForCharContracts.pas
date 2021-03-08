
{$i test.inc}

  unit Tests.ForCharContracts;

interface

  uses
    Deltics.Smoketest;


  type
    CharContractTests = class(TTest)
      procedure AnsiCharIsAsciiRaisesExceptionWhenArgumentIsNotAscii;
      procedure AnsiCharIsAsciiRaisesNoExceptionWhenArgumentIsAscii;
      procedure Utf8CharIsAsciiRaisesExceptionWhenArgumentIsLeadByte;
      procedure Utf8CharIsAsciiRaisesExceptionWhenArgumentIsContinuationByte;
      procedure Utf8CharIsAsciiRaisesNoExceptionWhenArgumentIsAscii;
      procedure Utf8CharIsLeadByteRaisesExceptionWhenArgumentIsAscii;
      procedure Utf8CharIsLeadByteRaisesExceptionWhenArgumentIsContinuationByte;
      procedure Utf8CharIsLeadByteRaisesNoExceptionWhenArgumentIsLeadByte;
      procedure Utf8CharIsNotContinuationRaisesExceptionWhenArgumentIsContinuationByte;
      procedure Utf8CharIsNotContinuationRaisesNoExceptionWhenArgumentIsAscii;
      procedure Utf8CharIsNotContinuationRaisesNoExceptionWhenArgumentIsLeadByte;
      procedure WideCharIsAsciiRaisesExceptionWhenArgumentIsNotAscii;
      procedure WideCharIsAsciiRaisesNoExceptionWhenArgumentIsAscii;
      procedure WideCharIsSurrogateRaisesExceptionWhenArgumentIsNotSurrogate;
      procedure WideCharIsSurrogateRaisesNoExceptionWhenArgumentIsSurrogate;
      procedure WideCharIsNotSurrogateRaisesExceptionWhenArgumentIsSurrogate;
      procedure WideCharIsNotSurrogateRaisesNoExceptionWhenArgumentIsNotSurrogate;
    end;



implementation

  uses
    Deltics.Contracts,
    TestConsts;



  procedure CharContractTests.AnsiCharIsAsciiRaisesExceptionWhenArgumentIsNotAscii;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', AnsiCopyright).IsAscii;
  end;


  procedure CharContractTests.AnsiCharIsAsciiRaisesNoExceptionWhenArgumentIsAscii;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', AnsiCapitalA).IsAscii;
  end;


  procedure CharContractTests.Utf8CharIsAsciiRaisesExceptionWhenArgumentIsLeadByte;
  begin
    Test.Raises(EArgumentException);

    Contract.RequiresUtf8('test', Utf8Copyright[1]).IsAscii;
  end;


  procedure CharContractTests.Utf8CharIsAsciiRaisesExceptionWhenArgumentIsContinuationByte;
  begin
    Test.Raises(EArgumentException);

    Contract.RequiresUtf8('test', Utf8Copyright[2]).IsAscii;
  end;


  procedure CharContractTests.Utf8CharIsAsciiRaisesNoExceptionWhenArgumentIsAscii;
  begin
    Test.RaisesNoException;

    Contract.RequiresUtf8('test', Utf8CapitalA).IsAscii;
  end;


  procedure CharContractTests.Utf8CharIsLeadByteRaisesExceptionWhenArgumentIsAscii;
  begin
    Test.Raises(EArgumentException);

    Contract.RequiresUtf8('test', Utf8CapitalA).IsLeadByte;
  end;


  procedure CharContractTests.Utf8CharIsLeadByteRaisesExceptionWhenArgumentIsContinuationByte;
  begin
    Test.Raises(EArgumentException);

    Contract.RequiresUtf8('test', Utf8Copyright[2]).IsLeadByte;
  end;


  procedure CharContractTests.Utf8CharIsLeadByteRaisesNoExceptionWhenArgumentIsLeadByte;
  begin
    Test.RaisesNoException;

    Contract.RequiresUtf8('test', Utf8Copyright[1]).IsLeadByte;
  end;


  procedure CharContractTests.Utf8CharIsNotContinuationRaisesExceptionWhenArgumentIsContinuationByte;
  begin
    Test.RaisesNoException;

    Contract.RequiresUtf8('test', Utf8Copyright[2]).IsNotContinuation;
  end;


  procedure CharContractTests.Utf8CharIsNotContinuationRaisesNoExceptionWhenArgumentIsAscii;
  begin
    Test.RaisesNoException;

    Contract.RequiresUtf8('test', Utf8CapitalA).IsNotContinuation;
  end;


  procedure CharContractTests.Utf8CharIsNotContinuationRaisesNoExceptionWhenArgumentIsLeadByte;
  begin
    Test.Raises(EArgumentException);

    Contract.RequiresUtf8('test', Utf8Copyright[1]).IsNotContinuation;
  end;


  procedure CharContractTests.WideCharIsAsciiRaisesExceptionWhenArgumentIsNotAscii;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideCopyright).IsAscii;
  end;


  procedure CharContractTests.WideCharIsAsciiRaisesNoExceptionWhenArgumentIsAscii;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideCapitalA).IsAscii;
  end;


  procedure CharContractTests.WideCharIsNotSurrogateRaisesExceptionWhenArgumentIsSurrogate;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideTrebleClef[1]).IsNotSurrogate;
  end;


  procedure CharContractTests.WideCharIsNotSurrogateRaisesNoExceptionWhenArgumentIsNotSurrogate;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideCopyright).IsNotSurrogate;
  end;


  procedure CharContractTests.WideCharIsSurrogateRaisesExceptionWhenArgumentIsNotSurrogate;
  begin
    Test.Raises(EArgumentException);

    Contract.Requires('test', WideCopyright).IsSurrogate;
  end;


  procedure CharContractTests.WideCharIsSurrogateRaisesNoExceptionWhenArgumentIsSurrogate;
  begin
    Test.RaisesNoException;

    Contract.Requires('test', WideTrebleClef[1]).IsSurrogate;
    Contract.Requires('test', WideTrebleClef[2]).IsSurrogate;
  end;




end.

