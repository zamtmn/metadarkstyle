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
    uDarkStyleParams,
    uWin32WidgetSetDark;
{$ENDIF}

procedure ApplyMetaDarkStyle(const CS:TDSColors);
procedure MetaDarkFormChanged(Form: TObject);

implementation

procedure ApplyMetaDarkStyle(const CS:TDSColors);
begin
  {$IFDEF WINDOWS}
  InitDarkMode;
  Initialize(CS);
  ApplyDarkStyle;
  {$ENDIF}
end;

procedure MetaDarkFormChanged(Form: TObject);
begin
  {$IFDEF WINDOWS}DarkFormChanged(Form);{$ENDIF}
end;
end.
