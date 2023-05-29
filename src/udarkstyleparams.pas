{
@author(Andrey Zubarev <zamtmn@yandex.ru>) 
}

unit uDarkStyleParams;

interface

uses
  LCLType,Graphics,ComCtrls;

type
  TSysColors=array[0..COLOR_ENDCOLORS] of TColor;
  TDrawControl=record
    TreeViewExpandSignOverride:Boolean;
    TreeViewExpandSignValue: TTreeViewExpandSignType;
    CustomDrawScrollbars:Boolean;
  end;

  TDSColors=record
    SysColor:TSysColors;
    DrawControl:TDrawControl;
  end;

  // Insider 18334
  TPreferredAppMode =
  (
    pamDefault,
    pamAllowDark,
    pamForceDark,
    pamForceLight
  );

var
  PreferredAppMode:TPreferredAppMode=pamForceLight;
  IsDarkModeEnabled: Boolean = False;

implementation

end.
