unit registerMetaDarkStyleDSGN;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  IDEOptionsIntf, IDEOptEditorIntf,
  uDarkStyleParams, uMetaDarkStyle, MetaDarkStyleDSGNOptionsFrame;

var
  MetaDarkStyleOptionsID: integer = 1000;


procedure Register;

implementation

procedure SetDarkStyle;
begin
  {$IF DEFINED(MSWINDOWS)}
  PreferredAppMode:=pamForceDark;
  ApplyMetaDarkStyle;
  {$ENDIF}
end;

procedure Register;
begin
  // add options frame
  MetaDarkStyleOptionsID:=RegisterIDEOptionsEditor(GroupEnvironment,
                                                   TDarkStyleDSGNOptionsFrame,
                                                   MetaDarkStyleOptionsID)^.Index;
end;

initialization
  SetDarkStyle;
end.

