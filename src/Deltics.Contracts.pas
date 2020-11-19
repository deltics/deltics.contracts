{
  * X11 (MIT) LICENSE *

  Copyright �2020 Jolyon Direnko-Smith

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
    Deltics.Contracts.Interfaces;


  type
    EArgumentException = Deltics.Exceptions.EArgumentException;


  procedure Require(const aArgument: String; aIsValid: Boolean); overload;
  function Require(const aArgument: String; aValue: AnsiChar): CharContracts; overload;
  function Require(const aArgument: String; aValue: WideChar): WideCharContracts; overload;
  function Require(const aArgument: String; aValue: Integer): IntegerContracts; overload;
  function Require(const aArgument: String; aValue: Pointer): PointerContracts; overload;
  function Require(const aArgument: String; const aValue: String): StringContracts; overload;
  function Require(const aArgument: String; const aValue: WideString): StringContracts; overload;

{$ifdef UNICODE}
  function Require(const aArgument: String; const aValue: AnsiString): StringContracts; overload;
{$endif}




implementation

  uses
    Deltics.Contracts.ForChars,
    Deltics.Contracts.ForIntegers,
    Deltics.Contracts.ForPointers,
    Deltics.Contracts.ForStrings,
  {$ifdef UNICODE}
    Deltics.Contracts.ForAnsiStrings,
  {$endif}
    Deltics.Contracts.ForWideStrings;



  procedure Require(const aArgument: String; aIsValid: Boolean); overload;
  begin
    if NOT aIsValid then
      raise EArgumentException.Create(aArgument + ' is invalid');
  end;


  function Require(const aArgument: String; aValue: AnsiChar): CharContracts;
  begin
    result := AnsiCharContractsImpl.Create(aArgument, aValue);
  end;


  function Require(const aArgument: String; aValue: WideChar): WideCharContracts;
  begin
    result := WideCharContractsImpl.Create(aArgument, aValue);
  end;


  function Require(const aArgument: String; aValue: Integer): IntegerContracts;
  begin
    result := IntegerContractsImpl.Create(aArgument, aValue);
  end;


  function Require(const aArgument: String; aValue: Pointer): PointerContracts;
  begin
    result := PointerContractsImpl.Create(aArgument, aValue);
  end;


  function Require(const aArgument: String; const aValue: String): StringContracts;
  begin
    result := StringContractsImpl.Create(aArgument, aValue);
  end;


  function Require(const aArgument: String; const aValue: WideString): StringContracts;
  begin
    result := WideStringContractsImpl.Create(aArgument, aValue);
  end;


{$ifdef UNICODE}
  function Require(const aArgument: String; const aValue: AnsiString): StringContracts;
  begin
    result := AnsiStringContractsImpl.Create(aArgument, aValue);
  end;
{$endif}


end.
