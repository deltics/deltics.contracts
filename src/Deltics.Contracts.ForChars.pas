
{$i deltics.contracts.inc}

  unit Deltics.Contracts.ForChars;


interface

  uses
    Deltics.StringTypes,
    Deltics.Contracts.Base,
    Deltics.Contracts.Interfaces;


  type
    AnsiCharContractsImpl = class(ContractsImpl, CharContracts)
    private
      fValue: AnsiChar;
    public
      constructor Create(const aArgument: String; const aValue: AnsiChar);
      procedure IsNotNull;
    end;


    Utf8CharContractsImpl = class(ContractsImpl, Utf8CharContracts)
    private
      fValue: Utf8Char;
    public
      constructor Create(const aArgument: String; const aValue: Utf8Char);
      procedure IsAscii;
      procedure IsLeadByte;
      procedure IsNotContinuation;
      procedure IsNotNull;
    end;


    WideCharContractsImpl = class(ContractsImpl, WideCharContracts)
    private
      fValue: WideChar;
    public
      constructor Create(const aArgument: String; const aValue: WideChar);
      procedure IsNotNull;
      procedure IsNotSurrogate;
      procedure IsSurrogate;
    end;



implementation

  uses
    Windows;


  const
    MIN_Surrogate   : WideChar = #$D800;
    MIN_HiSurrogate : WideChar = #$D800;
    MAX_HiSurrogate : WideChar = #$DBFF;
    MIN_LoSurrogate : WideChar = #$DC00;
    MAX_LoSurrogate : WideChar = #$DFFF;
    MAX_Surrogate   : WideChar = #$DFFF;


  function _IsHiSurrogate(aChar: WIDEChar): Boolean;
  begin
    result := (aChar >= MIN_HiSurrogate) and (aChar <= MAX_HiSurrogate);
  end;

  function _IsLoSurrogate(aChar: WIDEChar): Boolean;
  begin
    result := (aChar >= MIN_LoSurrogate) and (aChar <= MAX_LoSurrogate);
  end;

  function _IsSurrogate(aChar: WIDEChar): Boolean;
  begin
    result := (aChar >= MIN_Surrogate) and (aChar <= MAX_Surrogate);
  end;


  function AnsiCharToUnicode(const aValue: AnsiChar): UnicodeString;
  var
    len: Integer;
  begin
    result := '';

    len := MultiByteToWideChar(CP_ACP, 0, @aValue, 1, NIL, 0);

    // With max len = -1 then the reported length INCLUDES the null terminator
    //  which is automatically part of result
    Dec(len);
    SetLength(result, len);

    MultiByteToWideChar(CP_ACP, 0, @aValue, 1, @result[1], len);
  end;





{ AnsiCharContractsImpl }

  constructor AnsiCharContractsImpl.Create(const aArgument: String;
                                           const aValue: AnsiChar);
  begin
    inherited Create(aArgument);

    fValue        := aValue;
    ValueAsString := {$ifdef UNICODE} AnsiCharToUnicode(aValue) {$else} aValue {$endif};
  end;


  procedure AnsiCharContractsImpl.IsNotNull;
  begin
    if Ord(fValue) = 0 then
      RaiseException('{argument} cannot be null char');
  end;




{ WideCharContractsImpl }

  constructor WideCharContractsImpl.Create(const aArgument: String; const aValue: WideChar);
  begin
    inherited Create(aArgument);

    fValue        := aValue;
    ValueAsString := aValue;
  end;


  procedure WideCharContractsImpl.IsNotNull;
  begin
    if Ord(fValue) = 0 then
      RaiseException('{argument} cannot be null char');
  end;


  procedure WideCharContractsImpl.IsNotSurrogate;
  begin
    if _IsSurrogate(fValue) then
      RaiseException('{argument} cannot be a surrogate char');
  end;


  procedure WideCharContractsImpl.IsSurrogate;
  begin
    if NOT _IsSurrogate(fValue) then
      RaiseException('{argument} must be a surrogate char');
  end;




{ Utf8CharContractsImpl }

  constructor Utf8CharContractsImpl.Create(const aArgument: String;
                                           const aValue: Utf8Char);
  begin
    inherited Create(aArgument);

    fValue := aValue;
  end;


  procedure Utf8CharContractsImpl.IsAscii;
  begin
    if (Byte(fValue) and $80) = $00 then
      RaiseException('{argument} must be an Ascii char (not a lead byte)');
  end;


  procedure Utf8CharContractsImpl.IsLeadByte;
  begin
    if  ((Byte(fValue) and $e0) = $c0)
     or ((Byte(fValue) and $f0) = $e0)
     or ((Byte(fValue) and $f8) = $f0) then
      RaiseException('{argument} must be a lead byte (not Ascii and not a continuation byte)');
  end;


  procedure Utf8CharContractsImpl.IsNotNull;
  begin
    if Ord(fValue) = 0 then
      RaiseException('{argument} cannot be null char');
  end;


  procedure Utf8CharContractsImpl.IsNotContinuation;
  begin
    if (Byte(fValue) and $c0) <> $80 then
      RaiseException('{argument} cannot be a continuation byte');
  end;



end.
