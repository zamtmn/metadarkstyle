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
    uDarkStyleSchemesLoader,
    uWin32WidgetSetDark;
{$ENDIF}

{$IFDEF WINDOWS}
procedure ApplyMetaDarkStyle(const CS:TDSColors);
{$ENDIF}
procedure MetaDarkFormChanged(Form: TObject);

implementation

{$IFDEF WINDOWS}
procedure ApplyMetaDarkStyle(const CS:TDSColors);
begin
  InitDarkMode;
  Initialize(CS);
  ApplyDarkStyle;
end;
{$ENDIF}

procedure MetaDarkFormChanged(Form: TObject);
begin
  {$IFDEF WINDOWS}DarkFormChanged(Form);{$ENDIF}
end;
end.
