{
*****************************************************************************
*                                                                           *
*  This file is part of the ZCAD                                            *
*                                                                           *
*  See the file COPYING.txt, included in this distribution,                 *
*  for details about the copyright.                                         *
*                                                                           *
*  This program is distributed in the hope that it will be useful,          *
*  but WITHOUT ANY WARRANTY; without even the implied warranty of           *
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     *
*                                                                           *
*****************************************************************************
}
{
@author(Andrey Zubarev <zamtmn@yandex.ru>) 
}

unit uMetaDarkStyle;

interface

{$IFDEF WINDOWS}
uses
    {IF DEFINED(LCLQT5)}
      uDarkStyle,
    {ENDIF}
    uWin32WidgetSetDark;
{$ENDIF}

procedure ApplyMetaDarkStyle;
procedure MetaDarkFormChanged(Form: TObject);

implementation

procedure ApplyMetaDarkStyle;
begin
  {$IFDEF WINDOWS}
  InitDarkMode;
  Initialize;
  ApplyDarkStyle;
  {$ENDIF}
end;

procedure MetaDarkFormChanged(Form: TObject);
begin
  {$IFDEF WINDOWS}DarkFormChanged(Form);{$ENDIF}
end;
end.
