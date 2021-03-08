{
  * X11 (MIT) LICENSE *

  Copyright ©2020 Jolyon Direnko-Smith

  Permission is hereby granted, free of charge, to any person obtaining a copy of
   this software and associated documentation files (the "Software"), to deal in
   the Software without restriction, including without limitation the rights to
   use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
   of the Software, and to permit persons to whom the Software is furnished to do
   so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.


  * GPL and Other Licenses *

  The FSF deem this license to be compatible with version 3 of the GPL.
   Compatability with other licenses should be verified by reference to those
   other license terms.


  * Contact Details *

  Original author : Jolyon Direnko-Smith
  skype           : deltics
  github          : <EXTLINK https://github.com/deltics>github</EXTLINK>
  e-mail          : <EXTLINK mailto: jsmith@deltics.co.nz>jsmith@deltics.co.nz</EXTLINK>
  website         : <EXTLINK http://www.deltics.co.nz>www.deltics.co.nz</EXTLINK>
}

{$i deltics.contracts.inc}

  unit Deltics.Contracts;


interface

  uses
    Deltics.Exceptions,
    Deltics.Contracts.Interfaces,
    Deltics.StringTypes;


  type
    EArgumentException = Deltics.Exceptions.EArgumentException;


    Contract = class
    public
      class procedure Requires(const aArgument: String; aIsValid: Boolean); overload;

      class function Requires(const aArgument: String; aValue: AnsiChar): AnsiCharContracts; overload;
      class function Requires(const aArgument: String; aValue: WideChar): WideCharContracts; overload;
      class function Requires(const aArgument: String; aValue: Integer): IntegerContracts; overload;
      class function Requires(const aArgument: String; aValue: Pointer): PointerContracts; overload;
      class function Requires(const aArgument: String; const aValue: AnsiString): StringContracts; overload;
      class function Requires(const aArgument: String; const aValue: UnicodeString): StringContracts; overload;
    {$ifdef UNICODE}
      class function Requires(const aArgument: String; aValue: Utf8Char): Utf8CharContracts; overload;
      class function Requires(const aArgument: String; const aValue: Utf8String): StringContracts; overload;
      class function Requires(const aArgument: String; const aValue: WideString): StringContracts; overload;
    {$endif}
      class function RequiresUtf8(const aArgument: String; aValue: Utf8Char): Utf8CharContracts; overload;
      class function RequiresUtf8(const aArgument: String; const aValue: Utf8String): StringContracts; overload;
    end;



implementation

  uses
    Deltics.Contracts.ForChars,
    Deltics.Contracts.ForIntegers,
    Deltics.Contracts.ForPointers,
    Deltics.Contracts.ForAnsiStrings,
    Deltics.Contracts.ForUnicodeStrings,
    Deltics.Contracts.ForUtf8Strings,
    Deltics.Contracts.ForWideStrings;



  class procedure Contract.Requires(const aArgument: String; aIsValid: Boolean);
  begin
    if NOT aIsValid then
      raise EArgumentException.Create(aArgument + ' is invalid');
  end;


  class function Contract.Requires(const aArgument: String; aValue: AnsiChar): AnsiCharContracts;
  begin
    result := AnsiCharContractsImpl.Create(aArgument, aValue);
  end;


  class function Contract.Requires(const aArgument: String; aValue: WideChar): WideCharContracts;
  begin
    result := WideCharContractsImpl.Create(aArgument, aValue);
  end;


  class function Contract.Requires(const aArgument: String; aValue: Integer): IntegerContracts;
  begin
    result := IntegerContractsImpl.Create(aArgument, aValue);
  end;


  class function Contract.Requires(const aArgument: String; aValue: Pointer): PointerContracts;
  begin
    result := PointerContractsImpl.Create(aArgument, aValue);
  end;


  class function Contract.Requires(const aArgument: String; const aValue: AnsiString): StringContracts;
  begin
    result := AnsiStringContractsImpl.Create(aArgument, aValue);
  end;


  class function Contract.Requires(const aArgument: String; const aValue: UnicodeString): StringContracts;
  begin
  {$ifdef UNICODE}
    result := UnicodeStringContractsImpl.Create(aArgument, aValue);
  {$else}
    result := WideStringContractsImpl.Create(aArgument, aValue);
  {$endif}
  end;


{$ifdef UNICODE}
  class function Contract.Requires(const aArgument: String; aValue: Utf8Char): Utf8CharContracts;
  begin
    result := Utf8CharContractsImpl.Create(aArgument, aValue);
  end;


  class function Contract.Requires(const aArgument: String; const aValue: Utf8String): StringContracts;
  begin
    result := Utf8StringContractsImpl.Create(aArgument, aValue);
  end;


  class function Contract.Requires(const aArgument: String; const aValue: WideString): StringContracts;
  begin
    result := WideStringContractsImpl.Create(aArgument, aValue);
  end;
{$endif}


  class function Contract.RequiresUtf8(const aArgument: String; aValue: Utf8Char): Utf8CharContracts;
  begin
    result := Utf8CharContractsImpl.Create(aArgument, aValue);
  end;


  class function Contract.RequiresUtf8(const aArgument: String; const aValue: Utf8String): StringContracts;
  begin
    result := Utf8StringContractsImpl.Create(aArgument, aValue);
  end;




end.
