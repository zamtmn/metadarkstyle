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
