program CustomThemes;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  SysUtils,
  {for themes handling------------}
  LResources,// for including lrs themes
  uDarkStyleParams,
  uMetaDarkStyle,
  uDarkStyleSchemes,uDarkStyleSchemesLoader,
  uDarkStyleSchemesAdditional,// additional themes provided by metadarkstyle pkg
                              // at the moment it's only "CustomDark" theme
  {-------------------------------}
  Forms, USharedForm
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  {$I test.lrs}// see test.darkstylecolors script file,
               // test.lrs was received by the command 'lazres.exe test.lrs test.darkstylecolors'
  LoadLResources;//load all included lrs themes ('CustomDark','test')
  LoadPath(ExtractFilePath(ParamStr(0)),'*2.darkstylecolors');//load all *2.darkstylecolors from disk
                                                              //test2.lrs

  PreferredAppMode:=pamForceDark;
  //themes have been loaded
  //choose one below, this can only be done once when the program starts

  //uMetaDarkStyle.ApplyMetaDarkStyle(GetScheme('Dark'));      //system dark, provided by metadarkstyle pkg
  //uMetaDarkStyle.ApplyMetaDarkStyle(GetScheme('White'));     //white, provided by metadarkstyle pkg
  //uMetaDarkStyle.ApplyMetaDarkStyle(GetScheme('CustomDark'));//custom dark, provided by metadarkstyle in uDarkStyleSchemesAdditional
  uMetaDarkStyle.ApplyMetaDarkStyle(GetScheme('test'));      //from test.lrs resource
  //uMetaDarkStyle.ApplyMetaDarkStyle(GetScheme('test2'));     //from test2.darkstylecolors script file
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

