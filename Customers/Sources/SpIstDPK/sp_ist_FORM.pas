unit sp_ist_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
  pFIBDataSet, pFIBStoredProc, ActnList, Menus, COMMON, Grids, Db, DBGrids,
  pFIBQuery,cxInplaceContainer, cxTL,Ibase,Variants,
  cxDBTL, cxControls, cxTLData, cxGraphics, cxCustomData, cxStyles,
  cxTextEdit, cxContainer, cxEdit, StdCtrls, FIBDatabase, ImgList, dxBar,
  dxBarExtItems, cxClasses, cxGridTableView;

type
  TFsp_ist = class(TForm)
    ActionList1: TActionList;
    Action_Add: TAction;
    Action_Del: TAction;
    Action_Mod: TAction;
    Action_Refresh: TAction;
    Action_Sel: TAction;
    Action_Exit: TAction;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1NAME_IST: TcxDBTreeListColumn;
    cxDBTreeList1ID_IST: TcxDBTreeListColumn;
    cxDBTreeList1LINKTO: TcxDBTreeListColumn;
    cxDBTreeList1ITOG: TcxDBTreeListColumn;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    ChooseButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    procedure ExitButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure Action_AddExecute(Sender: TObject);
    procedure Action_DelExecute(Sender: TObject);
    procedure Action_ModExecute(Sender: TObject);
    procedure Action_RefreshExecute(Sender: TObject);
    procedure Action_SelExecute(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure PM_AddButtonClick(Sender: TObject);
    procedure PM_DelButtonClick(Sender: TObject);
    procedure PM_ModButtonClick(Sender: TObject);
    procedure PM_RefreshButtonClick(Sender: TObject);
    procedure PM_SelButtonClick(Sender: TObject);
    procedure PM_ExitButtonClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxDBTreeList1DblClick(Sender: TObject);
    procedure cxDBTreeList1KeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure CloseButtonClick(Sender: TObject);
  private
    fCanSelect      : boolean;
  public
    CurFS:TFormStyle;
    ActualDate:TDateTime;
    ResultValue:Variant;
    constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);overload;
    procedure CheckButtonsState;
    procedure SelectAll;
    procedure LocateRecord(const id : integer);
  end;

function GetIsts(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;stdcall;
exports GetIsts;


implementation


uses BaseTypes, sp_ist_FORM_ADD;
{$R *.DFM}

function GetIsts(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime):Variant;
    var T:TFsp_ist;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFsp_ist.Create(AOwner, DBHANDLE,FS,ActualDate);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFsp_ist.Create(AOwner, DBHANDLE,FS,ActualDate);
             Res:=NULL;
    end;

    GetIsts:=Res;
end;

constructor TFsp_ist.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurFS:=FS;
      if CurFS=fsNormal
      then ChooseButton.Enabled:=true;
      DataSet.SQLs.SelectSQL.Text := 'select * from VIEW_SP_ist';
      DataSet.Open;
      CheckButtonsState;
      self.FormStyle:=FS;

end;

procedure TFsp_ist.SelectAll;
begin
 DataSet.Active := false;
 DataSet.Active := true;
      CheckButtonsState;
end;

//Add record
procedure TFsp_ist.AddButtonClick(Sender: TObject);
var
 add_form : Tfsp_ist_form_add;
 id_ist   : integer;
 linkto   : integer;
 name_ist : string;
 itog     : integer;
 mr       : integer;
begin
 linkto := -1;

 add_form := Tfsp_ist_form_add.Create(Self);
 add_form.Caption := 'Додати';
 add_form.OkButton2.Enabled := cxDBTreeList1.FocusedNode <> NIL;
 mr := add_form.ShowModal;
 if (mr <> mrCancel) then begin
  if mr = mrOK then if cxDBTreeList1.FocusedNode <> NIL then linkto := cxDBTreeList1.FocusedNode.Values[cxDBTreeList1.ColumnByName('cxDBTreeList1' + 'LINKTO').ItemIndex];
  if mr = mrYES then if cxDBTreeList1.FocusedNode <> NIL then linkto := cxDBTreeList1.FocusedNode.Values[cxDBTreeList1.ColumnByName('cxDBTreeList1' + 'ID_IST').ItemIndex];
  name_ist := add_form.FullNameEdit.Text;
  itog := 1;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_IST_ADD', [linkto, name_ist, itog]);
  id_ist:=StoredProc.ParamByName('ID_IST').AsInteger;
  StoredProc.Transaction.Commit;

  SelectAll;
  LocateRecord(id_ist);
 end;
 add_form.Free;
end;

//Modify record
procedure TFsp_ist.EditButtonClick(Sender: TObject);
var
 mod_form      : Tfsp_ist_form_add;
 id_ist   : integer;
 name_ist : string;
 linkto   : integer;
 itog     : integer;
begin
 id_ist   := DataSet['ID_IST'];
 name_ist := DataSet['NAME_IST'];
 linkto   := DataSet['LINKTO'];
 itog := DataSet['ITOG'];

 mod_form := Tfsp_ist_form_add.Create(Self);
 mod_form.Caption := 'Змінити';
 mod_form.OKButton.Caption := 'Змінити';
 mod_form.OkButton2.Visible := false;
 mod_form.FullNameEdit.Text := name_ist;

 if mod_form.ShowModal = mrOK then begin
  name_ist  := mod_form.FullNameEdit.Text;

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PUB_SP_ist_MOD', [id_ist, linkto, name_ist, itog]);
  StoredProc.Transaction.Commit;

  SelectAll;
  LocateRecord(id_ist);
 end;
 mod_form.Free;
end;

//Delete record
procedure TFsp_ist.DelButtonClick(Sender: TObject);
var
 id_ist : integer;
begin
 if cxDBTreeList1.FocusedNode = NIL then exit;

 if cxDBTreeList1.FocusedNode.Count <> 0 then begin
  agShowMessage('Спочатку необхідно видалити всі дочірні класи');
  exit;
 end;

 if agMessageDlg('Увага', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo then exit;

 id_ist := DataSet['ID_IST'];
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_SP_ist_DEL', [id_ist]);
 StoredProc.Transaction.Commit;

 DataSet.CacheDelete;
 if DataSet.RecordCount <> 0 then id_ist := DataSet['ID_IST'];
 SelectAll;
 LocateRecord(id_ist);
end;

//Refresh dbgrid
procedure TFsp_ist.RefreshButtonClick(Sender: TObject);
var
 id_ist : integer;
begin
 if DataSet.RecordCount <> 0 then id_ist := DataSet['ID_ist'] else id_ist := -1;
 SelectAll;
 if id_ist <> -1 then LocateRecord(id_ist);
end;

//Close form
procedure TFsp_ist.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

//Select record
procedure TFsp_ist.SelButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild
 then Close
 else begin
         ResultValue:=VarArrayCreate([0,1],varVariant);
         ResultValue[0]:=DataSet['ID_IST'];
         ResultValue[1]:=DataSet['NAME_IST'];
         ModalResult := mrYes;

 end;
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////
procedure TFsp_ist.LocateRecord(const id : integer);
begin
 DataSet.Locate('ID_ist', id, [loCaseInsensitive]);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////
procedure TFsp_ist.CheckButtonsState;
begin
 if DataSet.RecordCount = 0 then begin
  DelButton.Enabled  := false;
  UpdateButton.Enabled  := false;
  ChooseButton.Enabled  := false;

 end else begin
  DelButton.Enabled  := true;
  UpdateButton.Enabled  := true;
 end;
end;

procedure TFsp_ist.DBGridDblClick(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////
procedure TFsp_ist.Action_AddExecute(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_ist.Action_DelExecute(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFsp_ist.Action_ModExecute(Sender: TObject);
begin
 EditButtonClick(Self);
end;

procedure TFsp_ist.Action_RefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_ist.Action_SelExecute(Sender: TObject);
begin
 if ChooseButton.Enabled then SelButtonClick(Self);
end;

procedure TFsp_ist.Action_ExitExecute(Sender: TObject);
begin
 ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////
procedure TFsp_ist.PM_AddButtonClick(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_ist.PM_DelButtonClick(Sender: TObject);
begin
 DelButtonClick(Self);
end;

procedure TFsp_ist.PM_ModButtonClick(Sender: TObject);
begin
 EditButtonClick(Self);
end;

procedure TFsp_ist.PM_RefreshButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_ist.PM_SelButtonClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;

procedure TFsp_ist.PM_ExitButtonClick(Sender: TObject);
begin
 ExitButtonClick(Self);
end;

procedure TFsp_ist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFsp_ist.dxDBTreeList1DblClick(Sender: TObject);
begin
 if (ChooseButton.Enabled) and (ivAlways = ChooseButton.Visible) then SelButtonClick(Self);
end;

procedure TFsp_ist.cxDBTreeList1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then if ChooseButton.Enabled then SelButtonClick(Self);
 if Key = #27 then Close;
end;

procedure TFsp_ist.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then cxDBTreeList1.SetFocus;
end;

procedure TFsp_ist.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

end.
