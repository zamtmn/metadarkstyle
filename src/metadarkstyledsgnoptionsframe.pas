unit MetaDarkStyleDSGNOptionsFrame;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls,
  IDEOptionsIntf,IDEOptEditorIntf,
  MetaDarkStyleDSGNOptions;

resourceString
  RSDarkStyleDSGNOptionsFrame='Dark style';


type

  { TDarkStyleDSGNOptionsFrame }

  TDarkStyleDSGNOptionsFrame = class(TAbstractIDEOptionsEditor)
    ComboBox1: TComboBox;
    Label1: TLabel;
  private

  public
    function GetTitle: String; override;
    procedure Setup({%H-}ADialog: TAbstractOptionsEditorDialog); override;
    procedure ReadSettings({%H-}AOptions: TAbstractIDEOptions); override;
    procedure WriteSettings({%H-}AOptions: TAbstractIDEOptions); override;
    procedure RestoreSettings({%H-}AOptions: TAbstractIDEOptions); override;
    class function SupportedOptionsClass: TAbstractIDEOptionsClass; override;
  end;

implementation

{$R *.lfm}

function TDarkStyleDSGNOptionsFrame.GetTitle: String;
begin
  result:=RSDarkStyleDSGNOptionsFrame;
end;

procedure TDarkStyleDSGNOptionsFrame.Setup({%H-}ADialog: TAbstractOptionsEditorDialog);
var
  i:TAppModeOpt;
begin
  ComboBox1.Items.Clear;
  for i:=low(AppModeOptStr) to high(AppModeOptStr) do
    ComboBox1.Items.Add(AppModeOptLocalizedStr[i]);
end;

procedure TDarkStyleDSGNOptionsFrame.ReadSettings({%H-}AOptions: TAbstractIDEOptions);
begin
  RestoreSettings(AOptions);
end;

procedure TDarkStyleDSGNOptionsFrame.WriteSettings({%H-}AOptions: TAbstractIDEOptions);
begin
  MetaDarkStyleDSGNOpt.AppMode:=TAppModeOpt(ComboBox1.ItemIndex);
  if MetaDarkStyleDSGNOpt.Modified then
    MetaDarkStyleDSGNOpt.SaveSafe;
end;

procedure TDarkStyleDSGNOptionsFrame.RestoreSettings({%H-}AOptions: TAbstractIDEOptions);
begin
  ComboBox1.ItemIndex:=ord(MetaDarkStyleDSGNOpt.AppMode);
end;

class function TDarkStyleDSGNOptionsFrame.SupportedOptionsClass: TAbstractIDEOptionsClass;
begin
  Result:=IDEEditorGroups.GetByIndex(GroupEnvironment)^.GroupClass;
end;

end.

