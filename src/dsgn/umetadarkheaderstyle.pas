{
  MetaDarkStyle - AnchorDocking DockHeader dark style

  Provides a custom 'MetaDark' header style for AnchorDocking so that the
  Lazarus IDE dock headers (e.g. the caption bar on top of Object Inspector)
  follow the metadarkstyle color scheme instead of the hard-coded clForm
  background used by the built-in styles (Frame3D / Line / Lines / Points).

  This unit lives in the design-time package (metadarkstyledsgn) because
  AnchorDocking is an IDE-only dependency.
}

unit uMetaDarkHeaderStyle;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Types, Graphics, LCLType,
  AnchorDocking, LazIDEIntf,
  uDarkStyleParams;

const
  MetaDarkHeaderStyleName = 'MetaDark';

type
  TMetaDarkHeaderHook = class
    procedure OnIDERestoreWindows(Sender: TObject);
  end;

procedure RegisterMetaDarkHeaderStyle(const ASchemeColors: TDSColors);
procedure HookIDERestoreWindows;
procedure ForceApplyMetaDarkHeaderStyle;

implementation

var
  HeaderColors: TDSColors;
  Hook: TMetaDarkHeaderHook = nil;
  HookInstalled: Boolean = False;

procedure DrawMetaDarkHeader(Canvas: TCanvas; {%H-}Style: TADHeaderStyleDesc;
  r: TRect; Horizontal: boolean; Focused: boolean);
begin
  Canvas.Brush.Color := HeaderColors.SysColor[COLOR_BTNFACE];
  Canvas.Brush.Style := bsSolid;
  Canvas.FillRect(r);

  Canvas.Font.Color := HeaderColors.SysColor[COLOR_BTNTEXT];

  if Focused then
  begin
    Canvas.Pen.Color := HeaderColors.SysColor[COLOR_HIGHLIGHT];
    if Horizontal then
      Canvas.Line(r.Left, r.Bottom - 1, r.Right, r.Bottom - 1)
    else
      Canvas.Line(r.Right - 1, r.Top, r.Right - 1, r.Bottom);
  end;
end;

// Force DockMaster.HeaderStyle to 'MetaDark' and ensure CurrentADHeaderStyle
// actually binds to DrawMetaDarkHeader. Handles two edge cases:
// (1) FHeaderStyle is already 'MetaDark' but CurrentADHeaderStyle's DrawProc
//     was not set to ours (setter's "if FHeaderStyle=AValue then Exit" early
//     return skipped the rebind). Break the equality by switching to a
//     different style first, then switch back.
// (2) FHeaderStyle is not 'MetaDark' (e.g. overwritten by LoadSettings when
//     anchordocking desktop was restored) - just switch it.
procedure ForceApplyMetaDarkHeaderStyle;
begin
  if DockMaster = nil then Exit;
  if SameText(DockMaster.HeaderStyle, MetaDarkHeaderStyleName) then
    DockMaster.HeaderStyle := 'Frame3D';
  DockMaster.HeaderStyle := MetaDarkHeaderStyleName;
end;

procedure RegisterMetaDarkHeaderStyle(const ASchemeColors: TDSColors);
begin
  HeaderColors := ASchemeColors;
  if DockMaster = nil then Exit;
  DockMaster.RegisterHeaderStyle(MetaDarkHeaderStyleName,
    @DrawMetaDarkHeader, False, True);
  ForceApplyMetaDarkHeaderStyle;
end;

procedure TMetaDarkHeaderHook.OnIDERestoreWindows(Sender: TObject);
begin
  // Latest reliable hook point before IDE shows windows. All options
  // (including anchordocking desktop settings) have finished loading by now.
  // If LoadSettings overwrote our MetaDark set during boot handler, this
  // forces it back.
  if IsDarkModeEnabled then
    ForceApplyMetaDarkHeaderStyle;
end;

procedure HookIDERestoreWindows;
begin
  if HookInstalled then Exit;
  if LazarusIDE = nil then Exit;
  if Hook = nil then
    Hook := TMetaDarkHeaderHook.Create;
  LazarusIDE.AddHandlerOnIDERestoreWindows(@Hook.OnIDERestoreWindows);
  HookInstalled := True;
end;

finalization
  FreeAndNil(Hook);

end.
