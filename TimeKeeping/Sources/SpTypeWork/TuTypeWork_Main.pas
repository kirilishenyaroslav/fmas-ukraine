unit TuTypeWork_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridCustomTableView, cxGridCardView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid, DB, cxDBData,
  dxStatusBar, cxGridTableView, cxGridDBTableView, dxBar, dxBarExtItems,
  TuCommonStyles,ZcxLocateBar,TuTypeWork_Permiss, cxCheckBox,TuTypeWork_Edit,
  TuCommonTypes;

type
  TFormTypeWork = class(TForm)
    BarManager: TdxBarManager;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
    ButtonUpdate: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxStatusBar1: TdxStatusBar;
    ButtonInsert: TdxBarLargeButton;
    ButtonPermis: TdxBarLargeButton;
    BarDockLocate: TdxBarDockControl;
    cxGrid1DBTableView1DBColumnName: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumnNameShort: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumnIsWork: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumnISPaid: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumnNum: TcxGridDBColumn;
    ButtonOk: TdxBarLargeButton;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure ButtonPermisClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
   pStylesDM:TStyleDM;
   PBarLocate:TZBarLocate;
   constructor create (Aowner:TComponent);reintroduce;
  end;

var
  FormTypeWork: TFormTypeWork;

implementation

uses TuTypeWork_DM;

{$R *.dfm}

{ TForm2 }

constructor TFormTypeWork.create(Aowner: TComponent);
var i:integer;
begin
  inherited create(Aowner);
  ButtonRefreshClick(nil);
  cxGrid1DBTableView1.DataController.DataSource:=DM.DSourceMain;
  pStylesDM:=TStyleDM.Create(Self);
  cxGrid1DBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  //******************************************************************************
  PBarLocate:=TZBarLocate.Create(BarManager);
  PBarLocate.DataSet := DM.DSetMain;
  PBarLocate.BorderStyle := bbsNone;
  PBarLocate.AddLocateItem('NAME_FULL',cxGrid1DBTableView1DBColumnName.Caption,[loCaseInsensitive,loPartialKey]);
  PBarLocate.AddLocateItem('NAME_NUM',cxGrid1DBTableView1DBColumnNum.Caption,[loCaseInsensitive,loPartialKey]);
  PBarLocate.DigitalField := 'NAME_NUM';
  PBarLocate.FieldSelectVisible := False;
  PBarLocate.DockControl := BarDockLocate;
 //******************************************************************************
  dxStatusBar1.Panels[0].text:='Ins - '+ButtonInsert.Caption;
  dxStatusBar1.Panels[1].text:='F2 - '+ButtonUpdate.Caption;
  dxStatusBar1.Panels[2].text:='Del - '+ButtonDelete.Caption;
  dxStatusBar1.Panels[3].text:='F5 - '+ButtonRefresh.Caption;
  dxStatusBar1.Panels[4].text:='F7 - '+ButtonPermis.Caption;
  dxStatusBar1.Panels[5].text:='Esc- '+ButtonExit.Caption;
//******************************************************************************
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

end;

procedure TFormTypeWork.ButtonRefreshClick(Sender: TObject);
begin
  DM.DSetMain.close;
  DM.DSetMain.SelectSQL.Text:='select * from  sp_vihod sv where sv.NAME_NUM is not null';
  Dm.DSetMain.Open;
  if DM.DSetMain.RecordCount=0 then
  begin
    ButtonUpdate.Enabled:=false;
    ButtonDelete.Enabled:=false;
  end
  else
  begin
    ButtonUpdate.Enabled:=true;
    ButtonDelete.Enabled:=true;
  end
end;

procedure TFormTypeWork.ButtonPermisClick(Sender: TObject);
Var Form:TFormPermis;
begin
  Form:=TFormPermis.create(self);
  Form.showmodal;
end;

procedure TFormTypeWork.ButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TFormTypeWork.ButtonOkClick(Sender: TObject);
begin
ModalResult:=MRyes;
end;

procedure TFormTypeWork.ButtonInsertClick(Sender: TObject);
var Form:TFormTypeWork_Edit;
  Param:TTypeWorkParam;
begin
  Param:=TTypeWorkParam.create;
  Param.Owner:=self;
  Param.CFStyle:=tcfsInsert;
  if View_TypeWorkEdit(Param) then
  begin
    ButtonRefreshClick(Sender);
    Dm.DSetMain.locate('ID_VIHOD',Param.id, []);
  end


end;

procedure TFormTypeWork.ButtonUpdateClick(Sender: TObject);
var Form:TFormTypeWork_Edit;
  Param:TTypeWorkParam;
  T:integer;
begin
  Param:=TTypeWorkParam.create;
  Param.Owner:=self;
  Param.CFStyle:=tcfsUpdate;
  if View_TypeWorkEdit(Param) then
  begin
    T:=Dm.DSetMain['ID_VIHOD'];
    ButtonRefreshClick(Sender);
    Dm.DSetMain.locate('ID_VIHOD',T, []);
  end
end;

procedure TFormTypeWork.ButtonDeleteClick(Sender: TObject);
var Form:TFormTypeWork_Edit;
  Param:TTypeWorkParam;
begin
  Param:=TTypeWorkParam.create;
  Param.Owner:=self;
  Param.CFStyle:=tcfsDelete;
  if View_TypeWorkEdit(Param) then
  begin
    ButtonRefreshClick(Sender);
  end

end;

procedure TFormTypeWork.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle=fsMDIChild then  Action:=caFree

end;

procedure TFormTypeWork.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
if FormStyle=fsnormal then  ButtonOkClick(Sender);
end;

end.
