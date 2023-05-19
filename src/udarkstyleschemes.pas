{
@author(Andrey Zubarev <zamtmn@yandex.ru>) 
}

unit uDarkStyleSchemes;

interface

uses
  LCLType,LCLIntf,Graphics,
  uDarkStyleParams;

var
  DefaultDark,DefaultWhite:TDSColors;

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

  DefaultWhite.SysColor[COLOR_SCROLLBAR]:=              GetSysColor(COLOR_SCROLLBAR);
  DefaultWhite.SysColor[COLOR_BACKGROUND]:=             GetSysColor(COLOR_BACKGROUND);
  DefaultWhite.SysColor[COLOR_ACTIVECAPTION]:=          GetSysColor(COLOR_ACTIVECAPTION);
  DefaultWhite.SysColor[COLOR_INACTIVECAPTION]:=        GetSysColor(COLOR_INACTIVECAPTION);
  DefaultWhite.SysColor[COLOR_MENU]:=                   GetSysColor(COLOR_MENU);
  DefaultWhite.SysColor[COLOR_WINDOW]:=                 GetSysColor(COLOR_WINDOW);
  DefaultWhite.SysColor[COLOR_WINDOWFRAME]:=            GetSysColor(COLOR_WINDOWFRAME);
  DefaultWhite.SysColor[COLOR_MENUTEXT]:=               GetSysColor(COLOR_MENUTEXT);
  DefaultWhite.SysColor[COLOR_WINDOWTEXT]:=             GetSysColor(COLOR_WINDOWTEXT);
  DefaultWhite.SysColor[COLOR_CAPTIONTEXT]:=            GetSysColor(COLOR_CAPTIONTEXT);
  DefaultWhite.SysColor[COLOR_ACTIVEBORDER] :=          GetSysColor(COLOR_ACTIVEBORDER);
  DefaultWhite.SysColor[COLOR_INACTIVEBORDER]:=         GetSysColor(COLOR_INACTIVEBORDER);
  DefaultWhite.SysColor[COLOR_APPWORKSPACE]:=           GetSysColor(COLOR_APPWORKSPACE);
  DefaultWhite.SysColor[COLOR_HIGHLIGHT]:=              GetSysColor(COLOR_HIGHLIGHT);
  DefaultWhite.SysColor[COLOR_HIGHLIGHTTEXT]:=          GetSysColor(COLOR_HIGHLIGHTTEXT);
  DefaultWhite.SysColor[COLOR_BTNFACE]:=                GetSysColor(COLOR_BTNFACE);
  DefaultWhite.SysColor[COLOR_BTNSHADOW]:=              GetSysColor(COLOR_BTNSHADOW);
  DefaultWhite.SysColor[COLOR_GRAYTEXT]:=               GetSysColor(COLOR_GRAYTEXT);
  DefaultWhite.SysColor[COLOR_BTNTEXT]:=                GetSysColor(COLOR_BTNTEXT);
  DefaultWhite.SysColor[COLOR_INACTIVECAPTIONTEXT]:=    GetSysColor(COLOR_INACTIVECAPTIONTEXT);
  DefaultWhite.SysColor[COLOR_BTNHIGHLIGHT]:=           GetSysColor(COLOR_BTNHIGHLIGHT);
  DefaultWhite.SysColor[COLOR_3DDKSHADOW]:=             GetSysColor(COLOR_3DDKSHADOW);
  DefaultWhite.SysColor[COLOR_3DLIGHT]:=                GetSysColor(COLOR_3DLIGHT);
  DefaultWhite.SysColor[COLOR_INFOTEXT]:=               GetSysColor(COLOR_INFOTEXT);
  DefaultWhite.SysColor[COLOR_INFOBK]:=                 GetSysColor(COLOR_INFOBK);
  DefaultWhite.SysColor[COLOR_HOTLIGHT]:=               GetSysColor(COLOR_HOTLIGHT);
  DefaultWhite.SysColor[COLOR_GRADIENTACTIVECAPTION]:=  GetSysColor(COLOR_GRADIENTACTIVECAPTION);
  DefaultWhite.SysColor[COLOR_GRADIENTINACTIVECAPTION]:=GetSysColor(COLOR_GRADIENTINACTIVECAPTION);
  DefaultWhite.SysColor[COLOR_MENUHILIGHT]:=            GetSysColor(COLOR_MENUHILIGHT);
  DefaultWhite.SysColor[COLOR_MENUBAR]:=                GetSysColor(COLOR_MENUBAR);
  DefaultWhite.SysColor[COLOR_FORM]:=                   GetSysColor(COLOR_FORM);
end;

initialization
  InitializeDefaultColors;
end.
