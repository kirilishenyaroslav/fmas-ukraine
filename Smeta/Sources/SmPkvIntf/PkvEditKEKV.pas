unit PkvEditKEKV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, ImgList,
  StdCtrls, cxContainer, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls,
  pFibStoredProc, FIBDataSet, pFIBDataSet;

type
  TfrmEditKEKV = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    ToolButton7: TToolButton;
    ToolButton14: TToolButton;
    CloseButton: TToolButton;
    cxGrid1: TcxGrid;
    PkvKekvView: TcxGridDBTableView;
    PkvKekvViewDBColumn2: TcxGridDBColumn;
    PkvKekvViewDBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    SprDateEdit: TcxDateEdit;
    Label1: TLabel;
    KekvDataSet: TpFIBDataSet;
    KekvDataSource: TDataSource;
    procedure CloseButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

uses PkvMain, GlobalSpr;

{$R *.dfm}

procedure TfrmEditKEKV.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmEditKEKV.AddButtonClick(Sender: TObject);
var Res: Variant;
    InsertSP:TpFibStoredProc;
begin
    Res:=GlobalSpr.GetKEKVSpr(self,
                              TfrmSmPkvMain(self.owner).WorkDatabase.Handle,
                              fsNormal,
                              SprDateEdit.Date,
                              1);
    if (VarArrayDimCount(Res)>0)
    then begin
              if not KekvDataSet.Locate('ID_PKV;ID_KEKV',VarArrayOf([TfrmSmPkvMain(self.owner).ProgrammDataSet.FieldByName('ID_PKV').AsString,Res[0][0]]),[])
              then begin
                        InsertSP:=TpFibStoredProc.Create(self);
                        InsertSP.Database   :=TfrmSmPkvMain(self.owner).WorkDatabase;
                        InsertSP.Transaction:=TfrmSmPkvMain(self.owner).WriteTransaction;
                        TfrmSmPkvMain(self.owner).WriteTransaction.StartTransaction;
                        InsertSP.StoredProcName:='BU_SM_PVK_KEKV_INSERT';
                        InsertSP.Prepare;
                        InsertSP.ParamByName('ID_PKV').AsInt64   :=StrToInt64(TfrmSmPkvMain(self.owner).ProgrammDataSet.FieldByName('ID_PKV').AsString);
                        InsertSP.ParamByName('ID_KEKV').AsInt64  :=VarAsType(Res[0][0], varInt64);
                        InsertSP.ParamByName('ADDING_DATE').Value:=SprDateEdit.Date;
                        InsertSP.ExecProc;
                        TfrmSmPkvMain(self.owner).WriteTransaction.Commit;
                        KekvDataSet.CloseOpen(true);
                        KekvDataSet.Locate('ID_PKV;ID_KEKV',VarArrayOf([TfrmSmPkvMain(self.owner).ProgrammDataSet.FieldByName('ID_PKV').AsString,Res[0][0]]),[]);
                        InsertSP.Close;
                        InsertSP.Free;
              end;
    end;
end;

procedure TfrmEditKEKV.FormCreate(Sender: TObject);
begin
     SprDateEdit.Date:=Date;
     KekvDataSet.Database   :=TfrmSmPkvMain(self.owner).WorkDatabase;
     KekvDataSet.Transaction:=TfrmSmPkvMain(self.owner).ReadTransaction;
     KekvDataSet.SelectSQL.Text:='SELECT * FROM BU_SM_PVK_KEKV_SELECT('+TfrmSmPkvMain(self.owner).ProgrammDataSet.FieldByName('ID_PKV').AsString+')';
     KekvDataSet.Open;
end;

procedure TfrmEditKEKV.ToolButton7Click(Sender: TObject);
begin
     KekvDataSet.CloseOpen(true);
end;

procedure TfrmEditKEKV.DelButtonClick(Sender: TObject);
var DeleteSP:TPFibStoredproc;
begin
     if (KekvDataSet.RecordCount>0)
     then begin
               DeleteSP:=TPFibStoredproc.Create(self);
               DeleteSP.Database:=TfrmSmPkvMain(self.owner).WorkDatabase;
               DeleteSP.Transaction:=TfrmSmPkvMain(self.owner).WriteTransaction;
               TfrmSmPkvMain(self.owner).WriteTransaction.StartTransaction;
               DeleteSP.StoredProcName:='BU_SM_PVK_KEKV_DELETE';
               DeleteSP.ParamByName('ID_PKV').AsInt64:=StrToInt64(TfrmSmPkvMain(self.owner).ProgrammDataSet.FieldByName('ID_PKV').AsString);
               DeleteSP.ParamByName('ID_KEKV').AsInt64:=StrToInt64(KekvDataSet.FieldByName('ID_KEKV').AsString);
               DeleteSP.ExecProc;
               KekvDataSet.CacheDelete;
               TfrmSmPkvMain(self.owner).WriteTransaction.Commit;
               DeleteSP.Free;
     end;
end;

end.
