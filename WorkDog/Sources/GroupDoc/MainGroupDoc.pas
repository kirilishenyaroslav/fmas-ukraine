unit MainGroupDoc;
{*******************************************************************************
* MainGroupDoc                                                                 *
*                                                                              *
* Справочник групп документов                                                  *
* Copyright ©  2004, Бурмистрова Е.                                            *
*******************************************************************************}

interface

uses
  Registry,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ToolWin, ComCtrls, ImgList, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, iBase, LoadDogManedger, RxMemDS, cxCalc,
  StdCtrls, cxTextEdit, cxTL, dxBar, dxBarExtItems, cxCheckBox, cxImage,
  ExtCtrls, dogLangPackUnit2, DogLoaderUnit, ActnList, frxClass, frxDBSet,
  dxStatusBar, Accmgmt;

resourcestring
    errGroupDel = 'Ви дійсно бажаєте видалити запис?';

type
  TfrmGroupDoc = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    DataSource: TDataSource;
    pFIBDatabase: TpFIBDatabase;
    pFIBDataSet_group_doc: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    ImageList1: TImageList;
    RxMemoryData_tip_dog: TRxMemoryData;
    id_group_doc: TcxGridDBColumn;
    pFIBDataSet_type_dog: TpFIBDataSet;
    DataSource_type_dog: TDataSource;
    GroupBox1: TGroupBox;
    cxGrid_tip_dog: TcxGrid;
    cxGrid_tip_dogDBTableView1: TcxGridDBTableView;
    name_tip_dog: TcxGridDBColumn;
    cxGrid_tip_dogLevel1: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton_add: TdxBarLargeButton;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarLargeButton_red: TdxBarLargeButton;
    dxBarButton3: TdxBarButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_get: TdxBarLargeButton;
    dxBarLargeButton_cl: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    TIP_DOG: TcxGridDBColumn;
    ACTIVE: TcxGridDBColumn;
    cxGrid_tip_dogDBTableView1DBColumn1: TcxGridDBColumn;
    dxBarDockControl1: TdxBarDockControl;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    CoolList: TImageList;
    Splitter1: TSplitter;
    ActionList1: TActionList;
    ins: TAction;
    edit: TAction;
    del: TAction;
    upd: TAction;
    cl: TAction;
    pFIBDataSet_tip: TpFIBDataSet;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxReport1: TfrxReport;
    dxStatusBar1: TdxStatusBar;
    del_dog: TAction;
    ins_dog: TAction;
//    procedure Add_Tip_Dog(ID:integer;Del:char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSet_group_docAfterScroll(DataSet: TDataSet);
//    procedure ToolButton_add_tClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure dxBarLargeButton_addClick(Sender: TObject);
    procedure dxBarLargeButton_redClick(Sender: TObject);
    procedure dxBarLargeButton_delClick(Sender: TObject);
    procedure dxBarLargeButton_updClick(Sender: TObject);
    procedure dxBarLargeButton_getClick(Sender: TObject);
    procedure dxBarLargeButton_clClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure cxGrid_tip_dogDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid_tip_dogDBTableView1DBColumn1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure pFIBDataSet_type_dogAfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure insExecute(Sender: TObject);
    procedure editExecute(Sender: TObject);
    procedure delExecute(Sender: TObject);
    procedure updExecute(Sender: TObject);
    procedure clExecute(Sender: TObject);
    procedure add_tipExecute(Sender: TObject);
    procedure del_dogExecute(Sender: TObject);
    procedure ins_dogExecute(Sender: TObject);
  private
    { Private declarations }
  public
  procedure IdGroup(id_gr: Variant);

  function GetId(id_group: Variant):Variant;

  constructor Create (Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle; Pr_vizova: String );overload;
    { Public declarations }
  end;

  function WorkGroupDoc(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE;frmStyle:TFormStyle; Pr_vizova: String ):Variant;stdcall;
  exports WorkGroupDoc;

var
  frmGroupDoc: TfrmGroupDoc;
  Res: Variant;
  pr_viz_per: String;
  id_gr_d: Variant; // id для позиционирование при добавлении
  img_ind : Integer;
  id_group_ins: Variant;//для позиционирования при добавлении

implementation
uses
  EditGroupDoc;

{$R *.dfm}

constructor TfrmGroupDoc.Create(Aowner:TComponent;DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle; Pr_vizova: String );
var
  i: Integer;
begin
  if Pr_vizova='spr' then
  begin
    inherited Create (Aowner);
    pFIBDatabase.Handle := DBHANDLE;
    pFIBDataSet_type_dog.Database := pFIBDatabase;
    pFIBDataSet_type_dog.Transaction := pFIBTransactionRead;
    pFIBDataSet_group_doc.Database := pFIBDatabase;
    pFIBDataSet_group_doc.Transaction := pFIBTransactionRead;
    pFIBDataSet_group_doc.Active := false;
    pFIBDataSet_group_doc.Active := true;
    FormStyle := frmStyle;
    dxBarLargeButton_get.Visible := ivNever;
    pFIBDataSet_type_dog.Active := false;
    pFIBDataSet_type_dog.Active := true;
    pr_viz_per := Pr_vizova;
  end
  else
  if Pr_vizova = 'tip_dog' then
  begin
    inherited Create (Aowner);
    pFIBDatabase.Handle := DBHANDLE;
    pFIBDataSet_type_dog.Database := pFIBDatabase;
    pFIBDataSet_type_dog.Transaction := pFIBTransactionRead;
    pFIBDataSet_group_doc.Database := pFIBDatabase;
    pFIBDataSet_group_doc.Transaction := pFIBTransactionRead;
    pFIBDataSet_group_doc.Active := false;
    pFIBDataSet_group_doc.Active := true;
    pFIBDataSet_type_dog.Active := false;
    pFIBDataSet_type_dog.Active := true;

    FormStyle := frmStyle;
//    GroupBox1.Visible := false;
    pr_viz_per := Pr_vizova;
  end;
end;

function WorkGroupDoc(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; frmStyle:TFormStyle; Pr_vizova: String):Variant;
var
  spr: TfrmGroupDoc;
begin
  spr:=TfrmGroupDoc.Create(AOwner, DBHANDLE, frmStyle, pr_vizova);
  if frmStyle = fsNormal then
  begin
    res := Unassigned;
    spr.ShowModal;
    WorkGroupDoc := res;     // возвращает данные
    spr.Free;
  end;
end;


function TfrmGroupDoc.GetId(id_group: Variant):Variant;
begin
//  id_group_ins := id_group;
end;

///////////////////////////////Сохранение параметров окна///////////////////

procedure SaveParam(Left,Top,Width,Height:integer;WinState:TWindowState);
  var
    Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\FMAS\Dogovor\SprGroupDoc', True) then
    begin
      Reg.WriteString('Left',IntToStr(Left));
      Reg.WriteString('Top',IntToStr(Top));
      Reg.WriteString('Width',IntToStr(Width));
      Reg.WriteString('Height',IntToStr(Height));
      if (WinState = wsMaximized) then Reg.WriteString('WindowState','1');
      if (WinState = wsMinimized) then Reg.WriteString('WindowState','2');
      if (WinState = wsNormal)    then Reg.WriteString('WindowState','3');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure LoadParam(var Left,Top,Width,Height:integer;var WinState:TWindowState);
  var
    Reg: TRegistry;
    a: string;
begin
  Reg := TRegistry.Create;
  try
    begin
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\FMAS\Dogovor\SprGroupDoc', True) then
    begin
      a := Reg.ReadString('Left');
      if (a <> '') then Left := StrToInt(a);
      a := Reg.ReadString('Top');
      if (a <> '') then Top := StrToInt(a);
      a := Reg.ReadString('Width');
      if (a <> '') then Width := StrToInt(a);
      a := Reg.ReadString('Height');
      if (a <> '') then Height := StrToInt(a);
      a := Reg.ReadString('WindowState');
      if a <> '' then begin
       if (a = '1') then WinState := wsMaximized;
       if (a = '2') then WinState := wsMinimized;
       if (a = '3') then WinState := wsNormal;
      end;
      Reg.CloseKey;
    end;
    end;
  finally
    Reg.Free;
  end;
end;


/////////////////////////////////////////////////////////////////



procedure TfrmGroupDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveParam(Left,Top,Width,Height,WindowState);
  Action := caFree;
end;

procedure TfrmGroupDoc.FormCreate(Sender: TObject);
var
    l,t,w,h:integer;
    a:TWindowState;
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Add') <> 0 then dxBarLargeButton_add.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Del') <> 0 then dxBarLargeButton_del.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Edit') <> 0 then dxBarLargeButton_red.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Add') <> 0 then dxBarLargeButton1.Visible := ivNever;
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Del') <> 0 then dxBarLargeButton2.Visible := ivNever;

  pFIBDataSet_type_dog.Database := pFIBDatabase;
  pFIBDataSet_type_dog.Transaction := pFIBTransactionRead;
  pFIBDataSet_group_doc.Active := false;
  pFIBDataSet_group_doc.Active := true;
  pFIBDataSet_type_dog.Active := false;
  pFIBDataSet_type_dog.Active := true;
//Интерфейс
  cxGrid1DBTableView1DBColumn1.Caption   := rsh_Number;
  cxGrid1DBTableView1DBColumn2.Caption   := rstd_name_gr;

  l:=Left;
  t:=Top;
  w:=Width;
  h:=Height;
  a:=WindowState;
  LoadParam(L,T,W,H,a);
  Left:=l;
  Top:=t;
  Width:=w;
  Height:=h;
  WindowState:=a;
end;

procedure TfrmGroupDoc.pFIBDataSet_group_docAfterScroll(DataSet: TDataSet);
begin
  cxGrid_tip_dogDBTableView1.DataController.FocusedRowIndex := 0;
{    pFIBDataSet_type_dog.Active := false;
    pFIBDataSet_type_dog.ParamByName('param').Value := pFIBDataSet_group_doc.FieldByName('id_group_doc').AsVariant;
    pFIBDataSet_type_dog.Active := true;}
end;

procedure TfrmGroupDoc.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if pr_viz_per = 'tip_dog' then
  begin
    dxBarLargeButton_getClick(Self);
  end;
end;

procedure TfrmGroupDoc.dxBarLargeButton_addClick(Sender: TObject);
var
   Add: TfrmEditGroupDoc;
begin
  Add := TfrmEditGroupDoc.Create(Self, '', '', false, 0);
  Add.ShowModal;
  add.Free;
  pFIBDataSet_group_doc.Active := false;
  pFIBDataSet_group_doc.Active := true;
  pFIBDataSet_type_dog.Active := FALSE;
  pFIBDataSet_type_dog.Active := True;
  pFIBDataSet_group_doc.Locate('id_group_doc', id_gr_d, []);
end;

procedure TfrmGroupDoc.dxBarLargeButton_redClick(Sender: TObject);
var
  Add: TfrmEditGroupDoc;
  id: Variant;
begin
  Add := TfrmEditGroupDoc.Create(Self,pFIBDataSet_group_doc.FieldByName('n_group_doc').AsString,
  pFIBDataSet_group_doc.FieldByName('name_group_doc').AsString, true, pFIBDataSet_group_doc.FieldByName('id_group_doc').AsVariant);
  id := pFIBDataSet_group_doc.FieldByName('id_group_doc').AsVariant;
  add.ShowModal;
  add.Free;
  pFIBDataSet_group_doc.Active := false;
  pFIBDataSet_group_doc.Active := true;
  pFIBDataSet_group_doc.Locate('id_group_doc', id, []);
  pFIBDataSet_type_dog.Active := false;
  pFIBDataSet_type_dog.Active := true;
end;

procedure TfrmGroupDoc.dxBarLargeButton_delClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar('Вы дійсно бажаєте видалити групу?'),
    'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
  begin
   pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
   pFIBTransactionWrite.StartTransaction;
   pFIBStoredProc.Database := pFIBDatabase;
   pFIBStoredProc.Transaction := pFIBTransactionWrite;
   pFIBStoredProc.StoredProcName := 'DOG_DT_GROUP_DOC_DELETE';
   pFIBStoredProc.Prepare;
   pFIBStoredProc.ParamByName('D_ID_GROUP_DOG').Value := pFIBDataSet_group_doc.FieldByName('id_group_doc').AsVariant;
   try
     pFIBStoredProc.ExecProc;
   except
     begin
       pFIBTransactionWrite.Rollback;
       Exit;
     end;
   end;
   pFIBTransactionWrite.Commit;
   pFIBDataSet_group_doc.Active := false;
   pFIBDataSet_group_doc.Active := true;
   pFIBDataSet_type_dog.Active := false;
   pFIBDataSet_type_dog.Active := true;
  end;

end;

procedure TfrmGroupDoc.dxBarLargeButton_updClick(Sender: TObject);
begin
  pFIBDataSet_group_doc.Active := false;
  pFIBDataSet_group_doc.Active := true;
  pFIBDataSet_type_dog.Active := FALSE;
  pFIBDataSet_type_dog.Active := true;
end;

procedure TfrmGroupDoc.dxBarLargeButton_getClick(Sender: TObject);
var
  max_change: Variant;
  i: Integer;
begin
  max_change := cxGrid1DBTableView1.DataController.GetSelectedCount;
  Res := VarArrayCreate([0, max_change-1], varVariant);
  for i := 0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
    begin
      Res[i] := VarArrayOf([cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[2],
                          cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1],
                          cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[0]]);
    end;
  close;
end;

procedure TfrmGroupDoc.dxBarLargeButton_clClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGroupDoc.IdGroup(id_gr: Variant);
begin
 id_gr_d := id_gr;
end;

procedure TfrmGroupDoc.dxBarLargeButton1Click(Sender: TObject);
var
  Tip_dog: Variant;
  cnt, i: Integer;
  t_id_tip_dog: Variant;
  t_tip_dog: String;
  id_group_doc: Variant;
begin
  id_group_doc := pFIBDataSet_group_doc.FieldByName('id_group_doc').Value;
  Tip_dog:=LoadDogManedger.WorkTypeDogSPR(self, pFIBDatabase.Handle, fsNormal, 'doc_group', Nil, id_group_doc, Nil);
//    Tip_dog:=LoadDogManedger.WorkTypeDogSPR(self, pFIBDatabase.Handle, fsNormal, 'fulfil', Nil, id_group_doc, Nil);
      if VarArrayDimCount(Tip_dog) > 0 then
       begin
         Cnt := VarArrayHighBound(Tip_dog, 1);
         for i := 0 to Cnt do
           begin
             t_id_tip_dog := Tip_dog[i][0];
             t_tip_dog := Tip_dog[i][1];
             pFIBStoredProc.Database := pFIBDatabase;
             pFIBStoredProc.Transaction := pFIBTransactionWrite;
             pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
             pFIBStoredProc.Transaction.StartTransaction;
             pFIBStoredProc.StoredProcName := 'DOG_GROUP_TIP_DOG_INSERT';
             pFIBStoredProc.Prepare;
             pFIBStoredProc.ParamByName('ID_TIP_DOG').Value := t_id_tip_dog;
             pFIBStoredProc.ParamByName('ID_GROUP_DOC').Value :=  pFIBDataSet_group_doc.FieldByName('id_group_doc').AsVariant;
             pFIBStoredProc.ParamByName('VALUE_GROUP').Value := 1;
             try
               pFIBStoredProc.ExecProc;
             except
               begin
                 pFIBTransactionWrite.Rollback;
                 Exit;
               end;
             end;
             pFIBTransactionWrite.Commit;

             pFIBDataSet_type_dog.Active := false;
             pFIBDataSet_type_dog.Active := true;
             pFIBDataSet_type_dog.Locate('tip_dog',t_tip_dog,[]);
           end;
       end;
end;

procedure TfrmGroupDoc.dxBarLargeButton2Click(Sender: TObject);
begin
   if MessageBox(Handle,PChar('Вы дійсно бажаєте видалити тип договору?'),
    'Підтвердження видалення',MB_YesNo or MB_Iconquestion) = mrYes then
    begin
      pFIBStoredProc.Database := pFIBDatabase;
      pFIBStoredProc.Transaction := pFIBTransactionWrite;
      pFIBTransactionWrite.DefaultDatabase := pFIBDatabase;
      pFIBStoredProc.Transaction.StartTransaction;
      pFIBStoredProc.StoredProcName := 'DOG_GROUP_TIP_DOG_INSERT';
      pFIBStoredProc.Prepare;
      pFIBStoredProc.ParamByName('ID_TIP_DOG').Value := pFIBDataSet_type_dog.FieldByName('id_tip_dog').AsInteger;
      pFIBStoredProc.ParamByName('ID_GROUP_DOC').Value :=  pFIBDataSet_group_doc.FieldByName('id_group_doc').AsVariant;
      pFIBStoredProc.ParamByName('VALUE_GROUP').Value := 0;
        try
          pFIBStoredProc.ExecProc;
        except
          begin
            pFIBTransactionWrite.Rollback;
            Exit;
               end;
             end;
             pFIBTransactionWrite.Commit;
//      Add_Tip_Dog(pFIBDataSet_type_dog.FieldByName('id_tip_dog').AsInteger, '0');
      pFIBDataSet_type_dog.Active := false;
      pFIBDataSet_type_dog.Active := true;
    end;
end;

procedure TfrmGroupDoc.cxGrid_tip_dogDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AviewInfo.GridRecord.Values[3] <> 1) then begin
            ACanvas.Font.Color := clGray;
            ADone := False;
    end;
end;

procedure TfrmGroupDoc.cxGrid_tip_dogDBTableView1DBColumn1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

begin
    if (AviewInfo.GridRecord.Values[3] = 1) then begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(CoolList,AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top,img_ind);
            ADone := True;

    end;
end;

procedure TfrmGroupDoc.pFIBDataSet_type_dogAfterScroll(DataSet: TDataSet);
begin
    if VarIsNull(pFIBDataSet_type_dog.FieldByName('value_group').Value) or (pFIBDataSet_type_dog.FieldByName('value_group').Value = 0) then
      dxBarLargeButton2.Enabled := false
    else
      dxBarLargeButton2.Enabled := True;
end;

procedure TfrmGroupDoc.Timer1Timer(Sender: TObject);
begin
    if img_ind < 7 then
        //img_ind := img_ind + 1
    else
        img_ind := 0;

    //cxGrid_tip_dog.UpdateControlState;
end;

procedure TfrmGroupDoc.insExecute(Sender: TObject);
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Add') <> 0 then Exit;
  dxBarLargeButton_addClick(Self);
end;

procedure TfrmGroupDoc.editExecute(Sender: TObject);
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Edit') <> 0 then Exit;
  dxBarLargeButton_redClick(Self);
end;

procedure TfrmGroupDoc.delExecute(Sender: TObject);
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Del') <> 0 then Exit;
  dxBarLargeButton_delClick(Self);
end;

procedure TfrmGroupDoc.updExecute(Sender: TObject);
begin
  dxBarLargeButton_updClick(Self);
end;

procedure TfrmGroupDoc.clExecute(Sender: TObject);
begin
  dxBarLargeButton_clClick(Self);
end;

procedure TfrmGroupDoc.add_tipExecute(Sender: TObject);
begin
  dxBarLargeButton1Click(Self);
end;

procedure TfrmGroupDoc.del_dogExecute(Sender: TObject);
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Del') <> 0 then Exit;
  dxBarLargeButton2Click(Self);
end;

procedure TfrmGroupDoc.ins_dogExecute(Sender: TObject);
begin
  if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Add') <> 0 then Exit;
  dxBarLargeButton1Click(Self);
end;

end.
