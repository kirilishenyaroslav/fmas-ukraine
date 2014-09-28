unit UPriceSmet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, ComCtrls, ToolWin, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ImgList, FIBDataSet, pFIBDataSet,
  pFibStoredProc, FIBDatabase, pFIBDatabase, RxMemDS, iBase, FIBQuery,
  pFIBQuery;

type
  TfrmGetValueSmet = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    backbold: TcxStyle;
    LargeImages: TImageList;
    PriceGridInfo: TcxGrid;
    FacultyView: TcxGridDBTableView;
    ParamColumn: TcxGridDBColumn;
    PriceGridInfoDBTableView1: TcxGridDBTableView;
    SpecialityView: TcxGridDBTableView;
    PriceGridInfoLevel1: TcxGridLevel;
    ToolBar3: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    FacultyViewDBColumn1: TcxGridDBColumn;
    FacultyViewDBColumn2: TcxGridDBColumn;
    FacultyViewDBColumn3: TcxGridDBColumn;
    FacultyViewDBColumn4: TcxGridDBColumn;
    GetInfoDataSet: TpFIBDataSet;
    GetInfoDataSource: TDataSource;
    HashDataSet: TRxMemoryData;
    ReadDataset: TpFIBDataSet;
    ReadTran: TpFIBTransaction;
    WorkStoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
  private
    { Private declarations }
    id_rec:Int64;
    function Checkdata:boolean;
    procedure RepairSmInfo;
  public
    { Public declarations }
     is_first_addition:Boolean;
     constructor Create(AOwner:TComponent;IdRec:int64);overload;
  end;

implementation

uses UPriceSmetAdd, UParamsReestr, BaseTypes;

{$R *.dfm}

constructor TfrmGetValueSmet.Create(AOwner: TComponent; IdRec:Int64);
begin
     inherited Create(AOwner);
     is_first_addition:=false;

     ReadTran.StartTransaction;
     GetInfoDataSet.Close;
     GetInfoDataSet.SelectSQL.Text:='SELECT * FROM CN_PRICES_SMET_SELECT('+IntToStr(IdRec)+')';
     GetInfoDataSet.Open;

     HashDataSet.CopyStructure(GetInfoDataSet);
     HashDataSet.LoadFromDataSet(GetInfoDataSet,0,lmCopy);

     id_rec:=idrec;
end;

procedure TfrmGetValueSmet.cxButton1Click(Sender: TObject);
begin
     if CheckData then ModalResult:=mrYes
                  else ShowMessage('Сума по процентам повинна дорівнювати 100!');
end;

procedure TfrmGetValueSmet.cxButton2Click(Sender: TObject);
begin
     if not is_first_addition then RepairSmInfo;
     ModalResult:=mrNo;
end;

procedure TfrmGetValueSmet.ToolButton3Click(Sender: TObject);
begin
      Close;
end;

procedure TfrmGetValueSmet.AddButtonClick(Sender: TObject);
var
  T:TfrmPriceSmetAdd;
  ID_PRICE_SMET:int64;
begin
     T:=TfrmPriceSmetAdd.Create(self);
      // источники по-умолчанию
       ReadDataSet.Close;
       ReadDataSet.SelectSQL.Clear;
       ReadDataSet.SelectSQL.Text := 'select * from CN_GET_DAEFAULT_ISTOCHNIKI';
       ReadDataSet.Open;
       if ReadDataSet['KOD_SMETA']  <> null then  T.SmText.Text:=  inttostr(ReadDataSet['KOD_SMETA']);
       if ReadDataSet['KOD_RAZDEL'] <> null then  T.RzText.Text:= inttostr(ReadDataSet['KOD_RAZDEL']);
       if ReadDataSet['KOD_STAT']   <> null then  T.StText.Text:=   inttostr(ReadDataSet['KOD_STAT']);
       if ReadDataSet['KOD_KEKV']   <> null then  T.KekvText.Text:=   inttostr(ReadDataSet['KOD_KEKV']);
       ReadDataSet.Close;

     if T.ShowModal=mrYes
     then begin
               WriteTransaction.StartTransaction;
               WorkStoredProc.StoredProcName:='CN_PRICES_SMET_INSERT';
               WorkStoredProc.Prepare;
               WorkStoredProc.ParamByName('ID_REC').AsInt64   :=id_rec;
               WorkStoredProc.ParamByName('ID_SMETA').AsInt64 :=T.id_smeta;
               WorkStoredProc.ParamByName('ID_RAZDEL').AsInt64:=T.id_razdel;
               WorkStoredProc.ParamByName('ID_STAT').AsInt64  :=T.id_stat;
               WorkStoredProc.ParamByName('ID_KEKV').AsInt64  :=T.id_kekv;
               WorkStoredProc.ParamByName('PERCENT').Value    :=T.PercentValue.Value;
               WorkStoredProc.ExecProc;
               ID_PRICE_SMET:=WorkStoredProc.ParamByName('ID_PRICE_SMET').AsInt64;
               Try
                WriteTransaction.Commit;
                WorkStoredProc.Close;
               Except
                WriteTransaction.Rollback;
                WorkStoredProc.Close;
               End; 
               GetInfoDataSet.CloseOpen(true);
               GetInfoDataSet.Locate('ID_PRICE_SMET',ID_PRICE_SMET,[]);
     end;
     T.Free;
end;

function TfrmGetValueSmet.Checkdata: boolean;
var
 Res:Boolean;
begin
     WriteTransaction.StartTransaction;
     WorkStoredProc.StoredProcName:='CN_PRICES_CHECK_SM_VALUE';
     WorkStoredProc.ParamByName('ID_REC').AsInt64:=id_rec;
     WorkStoredProc.ExecProc;
     if (WorkStoredProc.ParamByName('RESULT').AsInteger=1)then Res:=true
                                                          else Res:=false;
     Try
      WriteTransaction.Commit;
      WorkStoredProc.close;
     Except
      WriteTransaction.Rollback;
      WorkStoredProc.Close;
     End;

     result:=res;
end;

procedure TfrmGetValueSmet.RepairSmInfo;
var
  i:Integer;
begin
     WriteTransaction.StartTransaction;
     WorkStoredProc.StoredProcName:='CN_PRICES_SMET_CLEAR';
     WorkStoredProc.Prepare;
     WorkStoredProc.ParamByName('ID_REC').AsInt64:=id_rec;
     WorkStoredProc.ExecProc;

     WorkStoredProc.StoredProcName:='CN_PRICES_SMET_INSERT';
     WorkStoredProc.Prepare;

     HashDataSet.First;
     for i:=0 to HashDataSet.RecordCount-1 do
     begin
           WorkStoredProc.ParamByName('ID_REC').AsInt64   :=id_rec;
           WorkStoredProc.ParamByName('ID_SMETA').Value   :=HashDataSet.FieldByName('ID_SMETA').Value;
           WorkStoredProc.ParamByName('ID_RAZDEL').Value  :=HashDataSet.FieldByName('ID_RAZDEL').Value;
           WorkStoredProc.ParamByName('ID_STAT').Value    :=HashDataSet.FieldByName('ID_STAT').Value;
           WorkStoredProc.ParamByName('ID_KEKV').Value    :=HashDataSet.FieldByName('ID_KEKV').Value;
           WorkStoredProc.ParamByName('PERCENT').Value    :=HashDataSet.FieldByName('PERCENT').Value;
           WorkStoredProc.ExecProc;
           HashDataSet.Next;
     end;
     Try
      WriteTransaction.Commit;
      WorkStoredProc.close;
     Except
      WriteTransaction.Rollback;
      WorkStoredProc.Close;
     End;
end;

procedure TfrmGetValueSmet.UpdateButtonClick(Sender: TObject);
var
  T:TfrmPriceSmetAdd;
  ID_PRICE_SMET:int64;
begin
      if (GetInfoDataSet.RecordCount>0)
      then begin
                 T:=TfrmPriceSmetAdd.Create(self);
                 T.id_smeta :=GetInfoDataSet.FieldByName('ID_SMETA').Value;
                 T.id_razdel:=GetInfoDataSet.FieldByName('ID_RAZDEL').Value;
                 T.id_stat  :=GetInfoDataSet.FieldByName('ID_STAT').Value;
                 T.id_kekv  :=GetInfoDataSet.FieldByName('ID_KEKV').Value;


                 T.SmText.Text    :=GetInfoDataSet.FieldByName('CODE_SMETA').AsString;
                 T.RzText.Text    :=GetInfoDataSet.FieldByName('CODE_RAZDEL').AsString;
                 T.StText.Text    :=GetInfoDataSet.FieldByName('CODE_STAT').AsString;
                 T.KekvText.Text  :=GetInfoDataSet.FieldByName('CODE_KEKV').AsString;
                 T.LabelSm.Caption:=GetInfoDataSet.FieldByName('TEXT_SMETA').AsString;
                 T.LabelRz.Caption:=GetInfoDataSet.FieldByName('TEXT_RAZDEL').AsString;
                 T.LabelSt.Caption:=GetInfoDataSet.FieldByName('TEXT_STAT').AsString;
                 T.LabelKekv.Caption:=GetInfoDataSet.FieldByName('TEXT_KEKV').AsString;
                 T.PercentValue.Value:=GetInfoDataSet.FieldByName('PERCENT').Value;
                 if T.ShowModal=mrYes
                 then begin
                           WriteTransaction.StartTransaction;
                           WorkStoredProc.StoredProcName:='CN_PRICES_SMET_UPDATE';
                           WorkStoredProc.Prepare;
                           ID_PRICE_SMET:=StrToInt64(GetInfoDataSet.FieldByName('ID_PRICE_SMET').ASString);
                           WorkStoredProc.ParamByName('ID_PRICE_SMET').AsInt64   :=ID_PRICE_SMET;
                           WorkStoredProc.ParamByName('ID_REC').AsInt64          :=id_rec;
                           WorkStoredProc.ParamByName('ID_SMETA').AsInt64        :=T.id_smeta;
                           WorkStoredProc.ParamByName('ID_RAZDEL').AsInt64       :=T.id_razdel;
                           WorkStoredProc.ParamByName('ID_STAT').AsInt64         :=T.id_stat;
                           WorkStoredProc.ParamByName('ID_KEKV').AsInt64         :=T.id_kekv;
                           WorkStoredProc.ParamByName('PERCENT').Value           :=T.PercentValue.Value;
                           WorkStoredProc.ExecProc;
                           Try
                            WriteTransaction.Commit;
                            WorkStoredProc.Close;
                           Except
                            WriteTransaction.Rollback;
                            WorkStoredProc.Close;
                           End;
                           GetInfoDataSet.CloseOpen(true);
                           GetInfoDataSet.Locate('ID_PRICE_SMET',ID_PRICE_SMET,[]);
                 end;
                 T.Free;
      end;
end;

procedure TfrmGetValueSmet.DelButtonClick(Sender: TObject);
var
  ID_PRICE_SMET:Int64;
begin
      if (GetInfoDataSet.RecordCount>0)
      then begin
                if agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbyes,mbno])=mryes
                then begin
                           ID_PRICE_SMET:=StrToInt64(GetInfoDataSet.FieldByName('ID_PRICE_SMET').ASString);
                           WriteTransaction.StartTransaction;
                           WorkStoredProc.StoredProcName:='CN_PRICES_SMET_DELETE';
                           WorkStoredProc.Prepare;
                           WorkStoredProc.ParamByName('ID_PRICE_SMET').AsInt64   :=ID_PRICE_SMET;
                           WorkStoredProc.ExecProc;
                           Try
                            WriteTransaction.Commit;
                            WorkStoredProc.Close;
                           Except
                            WriteTransaction.Rollback;
                            WorkStoredProc.Close;
                           End; 
                           GetInfoDataSet.CacheDelete;
                end;
      end;
end;

end.
