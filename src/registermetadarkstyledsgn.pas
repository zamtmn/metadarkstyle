unit registerMetaDarkStyleDSGN;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  //idecoolbardata,
  uDarkStyleParams, uMetaDarkStyle;

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
  //if IDECoolBar<>nil then
  //  IDECoolBar.CoolBar.Themed:=false;
end;

initialization
  SetDarkStyle;
end.

