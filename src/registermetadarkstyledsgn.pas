unit registerMetaDarkStyleDSGN;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uDarkStyleParams, uMetaDarkStyle;

implementation

procedure SetDarkStyle;
begin
  {$IF DEFINED(MSWINDOWS)}
  PreferredAppMode:=pamForceDark;
  ApplyMetaDarkStyle;
  {$ENDIF}
end;

initialization
  SetDarkStyle;
end.

