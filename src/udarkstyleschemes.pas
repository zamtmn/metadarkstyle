{
@author(Andrey Zubarev <zamtmn@yandex.ru>) 
}

unit uDarkStyleSchemes;

interface

uses
  LCLType,LCLIntf,Graphics,
  uDarkStyleParams;

var
  DefaultDark,DefaultTest:TDSColors;

implementation

procedure InitializeDefaultColors;
begin
  DefaultDark.SysColor[COLOR_SCROLLBAR]:=               RGBToColor(53, 53, 53);
  DefaultDark.SysColor[COLOR_BACKGROUND]:=              RGBToColor(53, 53, 53);
  DefaultDark.SysColor[COLOR_ACTIVECAPTION]:=           RGBToColor(42, 130, 218);
  DefaultDark.SysColor[COLOR_INACTIVECAPTION]:=         RGBToColor(53, 53, 53);
  DefaultDark.SysColor[COLOR_MENU]:=                    RGBToColor(42, 42, 42);
  DefaultDark.SysColor[COLOR_WINDOW]:=                  RGBToColor(42, 42, 42);
  DefaultDark.SysColor[COLOR_WINDOWFRAME]:=             RGBToColor(20, 20, 20);
  DefaultDark.SysColor[COLOR_MENUTEXT]:=                RGBToColor(245, 245, 245);
  DefaultDark.SysColor[COLOR_WINDOWTEXT]:=              RGBToColor(245, 245, 245);
  DefaultDark.SysColor[COLOR_CAPTIONTEXT]:=             RGBToColor(245, 245, 245);
  DefaultDark.SysColor[COLOR_ACTIVEBORDER] :=           RGBToColor(53, 53, 53);
  DefaultDark.SysColor[COLOR_INACTIVEBORDER]:=          RGBToColor(53, 53, 53);
  DefaultDark.SysColor[COLOR_APPWORKSPACE]:=            RGBToColor(53, 53, 53);
  DefaultDark.SysColor[COLOR_HIGHLIGHT]:=               RGBToColor(42, 130, 218);
  DefaultDark.SysColor[COLOR_HIGHLIGHTTEXT]:=           RGBToColor(245, 245, 245);
  DefaultDark.SysColor[COLOR_BTNFACE]:=                 RGBToColor(53, 53, 53);
  DefaultDark.SysColor[COLOR_BTNSHADOW]:=               RGBToColor(35, 35, 35);
  DefaultDark.SysColor[COLOR_GRAYTEXT]:=                RGBToColor(160, 160, 160);
  DefaultDark.SysColor[COLOR_BTNTEXT]:=                 RGBToColor(245, 245, 245);
  DefaultDark.SysColor[COLOR_INACTIVECAPTIONTEXT]:=     RGBToColor(245, 245, 245);
  DefaultDark.SysColor[COLOR_BTNHIGHLIGHT]:=            RGBToColor(66, 66, 66);
  DefaultDark.SysColor[COLOR_3DDKSHADOW]:=              RGBToColor(20, 20, 20);
  DefaultDark.SysColor[COLOR_3DLIGHT]:=                 RGBToColor(40, 40, 40);
  DefaultDark.SysColor[COLOR_INFOTEXT]:=                RGBToColor(53, 53, 53);
  DefaultDark.SysColor[COLOR_INFOBK]:=                  RGBToColor(245, 245, 245);
  DefaultDark.SysColor[COLOR_HOTLIGHT]:=                RGBToColor(66, 66, 66);
  DefaultDark.SysColor[COLOR_GRADIENTACTIVECAPTION]:=   GetSysColor(COLOR_GRADIENTACTIVECAPTION);
  DefaultDark.SysColor[COLOR_GRADIENTINACTIVECAPTION]:= GetSysColor(COLOR_GRADIENTINACTIVECAPTION);
  DefaultDark.SysColor[COLOR_MENUHILIGHT]:=             RGBToColor(66, 66, 66);
  DefaultDark.SysColor[COLOR_MENUBAR]:=                 RGBToColor(42, 42, 42);
  DefaultDark.SysColor[COLOR_FORM]:=                    RGBToColor(53, 53, 53);

  DefaultTest.SysColor[COLOR_SCROLLBAR]:=               RGBToColor(53, 53, 153);
  DefaultTest.SysColor[COLOR_BACKGROUND]:=              RGBToColor(53, 53, 153);
  DefaultTest.SysColor[COLOR_ACTIVECAPTION]:=           RGBToColor(42, 130, 118);
  DefaultTest.SysColor[COLOR_INACTIVECAPTION]:=         RGBToColor(53, 53, 153);
  DefaultTest.SysColor[COLOR_MENU]:=                    RGBToColor(42, 42, 142);
  DefaultTest.SysColor[COLOR_WINDOW]:=                  RGBToColor(42, 42, 142);
  DefaultTest.SysColor[COLOR_WINDOWFRAME]:=             RGBToColor(20, 20, 120);
  DefaultTest.SysColor[COLOR_MENUTEXT]:=                RGBToColor(245, 245, 145);
  DefaultTest.SysColor[COLOR_WINDOWTEXT]:=              RGBToColor(245, 245, 145);
  DefaultTest.SysColor[COLOR_CAPTIONTEXT]:=             RGBToColor(245, 245, 145);
  DefaultTest.SysColor[COLOR_ACTIVEBORDER] :=           RGBToColor(53, 53, 153);
  DefaultTest.SysColor[COLOR_INACTIVEBORDER]:=          RGBToColor(53, 53, 153);
  DefaultTest.SysColor[COLOR_APPWORKSPACE]:=            RGBToColor(53, 53, 153);
  DefaultTest.SysColor[COLOR_HIGHLIGHT]:=               RGBToColor(42, 130, 118);
  DefaultTest.SysColor[COLOR_HIGHLIGHTTEXT]:=           RGBToColor(245, 245, 145);
  DefaultTest.SysColor[COLOR_BTNFACE]:=                 RGBToColor(53, 53, 153);
  DefaultTest.SysColor[COLOR_BTNSHADOW]:=               RGBToColor(35, 35, 135);
  DefaultTest.SysColor[COLOR_GRAYTEXT]:=                RGBToColor(160, 160, 250);
  DefaultTest.SysColor[COLOR_BTNTEXT]:=                 RGBToColor(245, 245, 145);
  DefaultTest.SysColor[COLOR_INACTIVECAPTIONTEXT]:=     RGBToColor(245, 245, 145);
  DefaultTest.SysColor[COLOR_BTNHIGHLIGHT]:=            RGBToColor(66, 66, 166);
  DefaultTest.SysColor[COLOR_3DDKSHADOW]:=              RGBToColor(20, 20, 120);
  DefaultTest.SysColor[COLOR_3DLIGHT]:=                 RGBToColor(40, 40, 140);
  DefaultTest.SysColor[COLOR_INFOTEXT]:=                RGBToColor(53, 53, 153);
  DefaultTest.SysColor[COLOR_INFOBK]:=                  RGBToColor(245, 245, 145);
  DefaultTest.SysColor[COLOR_HOTLIGHT]:=                RGBToColor(66, 66, 166);
  DefaultTest.SysColor[COLOR_GRADIENTACTIVECAPTION]:=   GetSysColor(COLOR_GRADIENTACTIVECAPTION);
  DefaultTest.SysColor[COLOR_GRADIENTINACTIVECAPTION]:= GetSysColor(COLOR_GRADIENTINACTIVECAPTION);
  DefaultTest.SysColor[COLOR_MENUHILIGHT]:=             RGBToColor(66, 66, 166);
  DefaultTest.SysColor[COLOR_MENUBAR]:=                 RGBToColor(42, 42, 142);
  DefaultTest.SysColor[COLOR_FORM]:=                    RGBToColor(53, 53, 153);
end;

initialization
  InitializeDefaultColors;
end.
