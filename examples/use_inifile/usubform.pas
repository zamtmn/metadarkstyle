unit usubform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls

  , uDarkStyleParams

  ;

type

  { TSubForm }

  TSubForm = class(TForm)
    Label1: TLabel;
    pbClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure pbCloseClick(Sender: TObject);
  private

  public

  end;

var
  SubForm: TSubForm;

implementation

{$R *.lfm}

{ TSubForm }

procedure TSubForm.FormCreate(Sender: TObject);
begin
    If IsDarkModeEnabled then
         Label1.Caption := 'Darkmode is enabled'
    else Label1.Caption := 'Darkmode is Not enabled';
end;

procedure TSubForm.pbCloseClick(Sender: TObject);
begin
   Close;
end;


end.

