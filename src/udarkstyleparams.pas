{
@author(Andrey Zubarev <zamtmn@yandex.ru>) 
}

unit uDarkStyleParams;

interface

uses
  LCLType,Graphics;

type
  TSysColors=array[0..COLOR_ENDCOLORS] of TColor;
  TDSColors=record
    SysColor:TSysColors;
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
