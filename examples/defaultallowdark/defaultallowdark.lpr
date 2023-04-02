program DefaultAllowDark;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  uMetaDarkStyle,
  Forms, USharedForm
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  uMetaDarkStyle.ApplyMetaDarkStyle;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

