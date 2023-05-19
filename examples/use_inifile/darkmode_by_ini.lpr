program darkmode_by_ini;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset

{
  uDarkStyleParams, uMetaDarkStyle,  uDarkStyleSchemes,
  IniFiles, SysUtils,   // SysUtils: for ExtractFilePath
}

  Forms, uMainForm, usubform
  { you can add units after this };


{
var
  ini: TIniFile; sInifile: String; iDarkMode: Integer;
}

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
{
  //uMetaDarkStyle.ApplyMetaDarkStyle;
  sInifile := ExtractFilePath(Paramstr(0)) + 'darkmode.ini';
  ini := TIniFile.Create(sInifile);
  iDarkMode := ini.ReadInteger('darkmodesetting', 'darkmode', 0);
  ini.Free;
  Case iDarkMode of
       0:  PreferredAppMode:=pamDefault;
       1:  PreferredAppMode:=pamAllowDark;
       2:  PreferredAppMode:=pamForceDark;
       3:  PreferredAppMode:=pamForceLight;
  end;
  if iDarkMode = 2 then    // Simplified for demo here
    uMetaDarkStyle.ApplyMetaDarkStyle(DefaultDark);
}
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSubForm, SubForm);
  Application.Run;
end.

