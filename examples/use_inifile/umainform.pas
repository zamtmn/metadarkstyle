unit uMainForm;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
   Menus, ComCtrls,

   Inifiles,
   uDarkStyleParams,
   uWin32WidgetSetDark, uDarkStyleSchemes, uMetaDarkStyle,

   usubform
   ;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    btnThemeSwitch: TButton;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ListView1: TListView;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    Separator1: TMenuItem;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    TreeView1: TTreeView;
    procedure btnThemeSwitchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}


// Alternativrly: settings invoked by the project file
procedure SetDarkStyle;
var ini: TIniFile; sInifile: String; iDarkMode: Integer;
begin
  sInifile := ExtractFilePath(Paramstr(0)) + 'darkmode.ini';
  ini := TIniFile.Create(sInifile);
  iDarkMode := ini.ReadInteger('darkmodesetting', 'darkmode', 0);
  ini.Free;
  Case iDarkMode of
       0:  PreferredAppMode:=pamDefault;
       1:  PreferredAppMode:=pamAllowDark;
       2:  PreferredAppMode:=pamForceDark;
       3:  PreferredAppMode:=pamForceLight;
  end;
  if iDarkMode = 2 then    // Simplified for demo here
     uMetaDarkStyle.ApplyMetaDarkStyle(DefaultDark);
end;


{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  if IsDarkModeEnabled then
       btnThemeSwitch.Caption := 'Do light mode'
  else btnThemeSwitch.Caption := 'Do dark mode';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with TSubForm.Create(nil) do
  try
      ShowModal();
    finally
      Free;
  end;
end;

procedure TForm1.btnThemeSwitchClick(Sender: TObject);
var ini: TIniFile; sInifile: String;
begin
  sInifile := ExtractFilePath(Paramstr(0)) + 'darkmode.ini';
  ini := TIniFile.Create(sInifile);
  if IsDarkModeEnabled then begin
     //PreferredAppMode:=pamForceLight;
     //MetaDarkFormChanged(self);
     //Invalidate;
     ini.WriteInteger('darkmodesetting', 'darkmode', 0);
     //btnThemeSwitch.Caption := 'Do dark mode';
     Label1.Caption := 'You still need to do a restart for to go to light mode';
     ShowMessage('Please restart the app for to make light mode active');
  end else begin
     ini.WriteInteger('darkmodesetting', 'darkmode', 2);
     //btnThemeSwitch.Caption := 'Do light mode';
     Label1.Caption := 'You still need to do a restart for to go to dark mode';
     ShowMessage('Please restart the app for to make dark mode active');
  end;
  ini.Free;
end;


initialization
  // It's also possible to initiate on project level (see comments within darkmode_by_ini.lpr)
  SetDarkStyle;

end.

