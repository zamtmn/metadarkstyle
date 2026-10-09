program ListViewHeader;

// A TListView in vsReport with GridLines under the forced dark style.
// The header (SysHeader32) and the gridlines are created and coloured by
// comctl32 itself, not through the hooked CreateWindowExW / GetSysColor.

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  uDarkStyleParams,
  uMetaDarkStyle,
  uDarkStyleSchemes,
  SysUtils, Forms, Controls, ComCtrls
  { you can add units after this };

{$R *.res}

var
  Form1: TForm;
  ListView: TListView;
  Item: TListItem;
  I: Integer;

begin
  RequireDerivedFormResource:=False; // the form is built in code, it has no .lfm
  Application.Scaled:=True;
  PreferredAppMode:=pamForceDark;
  uMetaDarkStyle.ApplyMetaDarkStyle(DefaultDark);
  Application.Initialize;
  Application.CreateForm(TForm, Form1);
  Form1.Caption:='TListView header and gridlines';
  Form1.Width:=480;
  Form1.Height:=240;

  ListView:=TListView.Create(Form1);
  ListView.Parent:=Form1;
  ListView.Align:=alClient;
  ListView.ViewStyle:=vsReport;
  ListView.GridLines:=True;
  ListView.RowSelect:=True;
  ListView.Columns.Add.Caption:='Name';
  ListView.Columns.Add.Caption:='Size';
  ListView.Columns.Add.Caption:='Status';
  for I:=1 to 4 do
  begin
    Item:=ListView.Items.Add;
    Item.Caption:='Item '+IntToStr(I);
    Item.SubItems.Add(IntToStr(I*100)+' KB');
    Item.SubItems.Add('Ready');
  end;
  for I:=0 to ListView.Columns.Count-1 do
    ListView.Columns[I].Width:=140;

  Application.Run;
end.
