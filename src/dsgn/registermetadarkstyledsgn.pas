unit registerMetaDarkStyleDSGN;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  IDEOptionsIntf, IDEOptEditorIntf, LazIDEIntf, lazconf,
  AnchorDocking,
  uDarkStyleParams, uDarkStyleSchemes, uMetaDarkStyle,
  MetaDarkStyleDSGNOptionsFrame, MetaDarkStyleDSGNOptions,
  uMetaDarkHeaderStyle;

var
  MetaDarkStyleOptionsID: integer = 1000;


procedure Register;

implementation

function AppModeOpt2PreferredAppMode(am:TAppModeOpt):TPreferredAppMode;
begin
  case am of
    amOptAllowDark:result:=pamAllowDark;
    amOptForceDark:result:=pamForceDark;
   amOptForceLight:result:=pamForceLight;
  end;
end;

procedure SetDarkStyle;
{$IF DEFINED(MSWINDOWS)}
var
  Scheme: TDSColors;
{$ENDIF}
begin
 {$IF DEFINED(MSWINDOWS)}
  LoadLResources;
  LoadPath(GetPrimaryConfigPath+'/userschemes','*.'+DSColorsTypeName);
  LoadPath(GetSecondaryConfigPath+'/userschemes','*.'+DSColorsTypeName);
  MetaDarkStyleDSGNOpt:=TMetaDarkStyleDSGNOptions.Create;
  MetaDarkStyleDSGNOpt.LoadSafe;
  PreferredAppMode:=AppModeOpt2PreferredAppMode(MetaDarkStyleDSGNOpt.AppMode);
  Scheme:=GetScheme(MetaDarkStyleDSGNOpt.ColorScheme);
  ApplyMetaDarkStyle(Scheme);
  if IsDarkModeEnabled and (DockMaster<>nil) then begin
    RegisterMetaDarkHeaderStyle(Scheme);
    DockMaster.HeaderStyle:=MetaDarkHeaderStyleName;
  end;
 {$ENDIF}
end;

procedure Register;
begin
  MetaDarkStyleOptionsID:=RegisterIDEOptionsEditor(GroupEnvironment,
                                                   TDarkStyleDSGNOptionsFrame,
                                                   MetaDarkStyleOptionsID)^.Index;
  HookIDERestoreWindows;
end;

initialization
  AddBootHandler(libhEnvironmentOptionsLoaded,@SetDarkStyle);
end.

