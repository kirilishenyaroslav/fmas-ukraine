unit USmGlReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,
  pFibStoredProc;

type
  TfrmSmGlReestr = class(TForm)
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
    GrView: TcxGridDBTableView;
    GrViewDBColumn2: TcxGridDBColumn;
    GrViewDBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ReestrDataSet: TpFIBDataSet;
    ReestrDataSource: TDataSource;
    procedure CloseButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses GlobalSpr, USmGlMain, BaseTypes;

{$R *.dfm}

procedure TfrmSmGlReestr.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmGlReestr.AddButtonClick(Sender: TObject);
var Res:Variant;
    InsertSP:TpFibStoredProc;
    new_id:Integer;
begin
     Res:=GlobalSpr.GetSmets(self,
                             TfrmSmGlMain(Owner).WorkDatabase.Handle,
                             Date,
                             psmSmetWithoutPeriod);
     if VarArrayDimCount(Res)>0
     then begin
               if not ReestrDataSet.Locate('ID_SM',Res[0],[])
               then begin
                         InsertSP:=TpFibStoredProc.Create(self);
                         InsertSP.Database   :=TfrmSmGlMain(Owner).WorkDatabase;
                         InsertSP.Transaction:=TfrmSmGlMain(Owner).WriteTransaction;
                         TfrmSmGlMain(Owner).WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='BU_SM_GLOBAL_REESTR_INSERT';
                         InsertSP.Prepare;
                         InsertSP.ParamByName('ID_OBJECT').AsInt64:=StrToInt64(TfrmSmGlMain(Owner).GlobalObjDataSet.FieldByName('ID_OBJECT').AsString);
                         InsertSP.ParamByName('ID_SM').Value      :=Res[0];
                         InsertSP.ExecProc;
                         new_id:=InsertSP.ParamByName('ID_REESTR').Value;
                         TfrmSmGlMain(Owner).WriteTransaction.Commit;
                         ReestrDataSet.CloseOpen(true);
                         ReestrDataSet.Locate('ID_REESTR',new_id,[])
               end;
     end;
end;

procedure TfrmSmGlReestr.FormCreate(Sender: TObject);
begin
     ReestrDataSet.Database   :=TfrmSmGlMain(Owner).WorkDatabase;
     ReestrDataSet.Transaction:=TfrmSmGlMain(Owner).ReadTransaction;
     ReestrDataSet.SelectSQL.Text:='SELECT * FROM BU_SM_GLOBAL_REESTR_SELECT('+TfrmSmGlMain(Owner).GlobalObjDataSet.FieldByName('ID_OBJECT').AsString+')';
     ReestrDataSet.Open;
end;

procedure TfrmSmGlReestr.DelButtonClick(Sender: TObject);
var DeleteSp:TpFibStoredProc;
begin
     if self.ReestrDataSet.RecordCount>0
     then begin
               if agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         DeleteSp               :=TpFibStoredProc.Create(self);
                         DeleteSp.Database      :=TfrmSmGlMain(Owner).WorkDatabase;
                         DeleteSp.Transaction   :=TfrmSmGlMain(Owner).WriteTransaction;
                         TfrmSmGlMain(Owner).WriteTransaction.StartTransaction;
                         DeleteSp.StoredProcName:='BU_SM_GLOBAL_REESTR_DELETE';
                         DeleteSp.Prepare;
                         DeleteSp.ParamByName('ID_REESTR').AsInt64:=StrToInt64(ReestrDataSet.FieldByName('ID_REESTR').AsString);
                         DeleteSp.ExecProc;
                         TfrmSmGlMain(Owner).WriteTransaction.Commit;
                         ReestrDataSet.CacheDelete;
                         DeleteSp.Free;
               end;
     end;
end;

end.
