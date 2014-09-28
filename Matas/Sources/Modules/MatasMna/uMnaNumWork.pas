unit uMnaNumWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid,uMatasMnaMain, cxLookAndFeelPainters,
  cxButtons, ExtCtrls, Grids, DBGrids, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, ActnList, ibase, uMatasUtils, uResources,
  ImgList, Buttons, Menus;

type
  TNumWork = class(TForm)
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel1: TPanel;
    DBNum: TpFIBDatabase;
    NumDataSet: TpFIBDataSet;
    InvNumDataSource: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    NumDataSetID_MNA_INUM: TFIBBCDField;
    NumDataSetINV_NUM: TFIBStringField;
    NumDataSetZAVNUM: TFIBStringField;
    NumDataSetPASSNUM: TFIBStringField;
    StoredProc: TpFIBStoredProc;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDel: TAction;
    acExit: TAction;
    AddButton: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    acRefresh: TAction;
    ImageList: TImageList;
    pmDragMetOper: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pmInvNom: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDelExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
   ID_MNA_KART:integer;
  public
    { Public declarations }
    inv_num, zav_num, pas_num:Integer;
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_MNA_KART:integer);overload;
  end;

var
  NumWork: TNumWork;

implementation
{$R *.dfm}
 uses uMnaNumAdd;

constructor TNumWork.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; ID_MNA_KART:integer);
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle) then
 begin
  Self.DBHANDLE := aDBHandle;
  Self.DBNum.Close;
  Self.DBNum.Handle := DBHANDLE;
  Self.ID_MNA_KART:= ID_MNA_KART;
  Self.ReadTransaction.StartTransaction;
  Self.acAdd.Caption:=MAT_ACTION_ADD_CONST;
  Self.acEdit.Caption:=MAT_ACTION_UPDATE_CONST;
  Self.acDel.Caption:=MAT_ACTION_DELETE_CONST;
  Self.acExit.Caption:=MAT_ACTION_CLOSE_CONST;
  Self.acRefresh.Caption:=MAT_ACTION_REFRESH_CONST;
  NumDataSet.Close;
  NumDataSet.ParamByName('ID_MNA_KART').Value:=ID_MNA_KART;
  NumDataSet.CloseOpen(False);
 end;
end;

procedure TNumWork.acAddExecute(Sender: TObject);
var FM:TNumAddForm;
    vals : array of Variant;
begin
 FM:=TNumAddForm.Create(self);
 FM.ShowModal;
 if FM.ModalResult=mrOk then
  begin
    SetLength(Vals, 4);
    Vals[0] := ID_MNA_KART;
    Vals[1] := FM.teInNum.text;
    Vals[2] := FM.teZavNum.text;
    Vals[3] := FM.tePasNum.Text;
     try
      StoredProc.Close;
      StoredProc.Transaction := WriteTransaction;
      StoredProc.Transaction.StartTransaction;
      StoredProc.ExecProcedure('MAT_DT_MNA_INUM_INSERT', vals);
      StoredProc.Transaction.Commit;
    except on E : Exception
      do begin
        ShowMessage(E.Message);
        StoredProc.Transaction.Rollback;
        exit;
      end;
    end;
    NumDataSet.Close;
    NumDataSet.ParamByName('ID_MNA_KART').Value:=ID_MNA_KART;
    NumDataSet.CloseOpen(False);
  end;
end;

procedure TNumWork.acEditExecute(Sender: TObject);
var FM:TNumAddForm;
   vals : array of Variant;
begin
 FM:=TNumAddForm.Create(self);
 FM.teInNum.Text:=NumDataSet.FieldByName('INV_NUM').Value;
 FM.teZavNum.Text:=NumDataSet.FieldByName('ZAVNUM').Value;
 FM.tePasNum.Text:=NumDataSet.FieldByName('PASSNUM').Value;
 FM.ShowModal;
  if FM.ModalResult=mrOk then
  begin
    SetLength(Vals, 5);
    Vals[0] := NumDataSet.FieldByName('ID_MNA_INUM').AsInteger;
    Vals[1] := ID_MNA_KART;
    Vals[2] := StrToInt(FM.teInNum.text);
    Vals[3] := StrToInt(FM.teZavNum.text);
    Vals[4] := StrToInt(FM.tePasNum.Text);
     try
      StoredProc.Close;
      StoredProc.Transaction := WriteTransaction;
      StoredProc.Transaction.StartTransaction;
      StoredProc.ExecProcedure('MAT_DT_MNA_INUM_UPDATE', vals);
      StoredProc.Transaction.Commit;
    except on E : Exception
      do begin
        ShowMessage(E.Message);
        StoredProc.Transaction.Rollback;
        exit;
      end;
    end;
    NumDataSet.Close;
    NumDataSet.ParamByName('ID_MNA_KART').Value:=ID_MNA_KART;
    NumDataSet.CloseOpen(False);
  end;
end;

procedure TNumWork.acDelExecute(Sender: TObject);
var
   vals : array of Variant;
begin
 if agMessageDlg(MAT_STR_WARNING, MAT_STR_ASK_DELETE, mtConfirmation, [mbYes, mbNo]) = ID_YES
 then begin
   SetLength(Vals, 1);
   Vals[0]  := NumDataSet.FieldByName('ID_MNA_INUM').AsInteger;
   try
    StoredProc.Close;
    StoredProc.Transaction := WriteTransaction;
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('MAT_DT_MNA_INUM_DELETE', vals);
    StoredProc.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     StoredProc.Transaction.Rollback;
     exit;
    end;
   end;
   NumDataSet.CloseOpen(False);
  end;
end;

procedure TNumWork.acExitExecute(Sender: TObject);
begin
Close;
end;

procedure TNumWork.acRefreshExecute(Sender: TObject);
begin
  NumDataSet.CloseOpen(False);
end;

end.
