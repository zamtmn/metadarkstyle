unit MetaDarkStyleDSGNOptionsFrame;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls,
  IDEOptionsIntf,IDEOptEditorIntf;

resourceString
  RSDarkStyleDSGNOptionsFrame='Dark style';


type
  TDarkStyleDSGNOptionsFrame = class(TAbstractIDEOptionsEditor)
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
begin
end;

procedure TDarkStyleDSGNOptionsFrame.ReadSettings({%H-}AOptions: TAbstractIDEOptions);
begin
end;

procedure TDarkStyleDSGNOptionsFrame.WriteSettings({%H-}AOptions: TAbstractIDEOptions);
begin
end;

procedure TDarkStyleDSGNOptionsFrame.RestoreSettings({%H-}AOptions: TAbstractIDEOptions);
begin
end;

class function TDarkStyleDSGNOptionsFrame.SupportedOptionsClass: TAbstractIDEOptionsClass;
begin
  Result:=IDEEditorGroups.GetByIndex(GroupEnvironment)^.GroupClass;
end;

end.

