unit UExtSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, ComCtrls, ToolWin, StdCtrls,
  cxButtons, ExtCtrls, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ImgList, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, cxTextEdit,
  pFibStoredProc, ActnList, dxStatusBar;

type
  TfrmExtSaldo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    SmallImages: TImageList;
    ExtSaldoDataSet: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    ExtSaldoDataSource: TDataSource;
    ActionList1: TActionList;
    Esc: TAction;
    dxStatusBar1: TdxStatusBar;
    Enter: TAction;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure EnterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    WereChanges:Boolean;
    procedure GetData;
    { Public declarations }
  end;


implementation


uses uMainSchSaldo, Kernel, UEditSaldo;

{$R *.dfm}
procedure TfrmExtSaldo.GetData;
// var RecInfo:RECORD_INFO_STRUCTURE;
//     ResultInfo:RESULT_STRUCTURE;
begin
{     RecInfo.TRHANDLE       :=TfrmSchSaldo(owner).ReadTransaction.Handle;
     RecInfo.DBHANDLE       :=TfrmSchSaldo(owner).WorkDatabase.Handle;
     RecInfo.ID_RECORD      :=VarArrayOf([TfrmSchSaldo(owner).SchTreeSaldoDataSet.FieldByName('ID_SALDO').AsString]);
     RecInfo.PK_FIELD_NAME  :=VarArrayOf(['ID_SALDO']);
     RecInfo.TABLE_NAME     :='PUB_DT_SCH_SALDO_EXT';
     RecInfo.RAISE_FLAG     :=false;

     ResultInfo:=Kernel.LockRecord(@RecInfo);
     StatusBar1.Panels[1].Text:=ResultInfo.RESULT_MESSAGE;}

     if ExtSaldoDataSet.Active then ExtSaldoDataSet.Close;
     ExtSaldoDataSet.SelectSQL.Text:='SELECT * FROM PUB_DT_SCH_SALDO_EXT_SELECT2('+
     TfrmSchSaldo(owner).SchTreeSaldoDataSet.FieldByName('ID_SCH').AsString+','+
     ''''+DateToStr(TfrmSchSaldo(owner).ActualDate)+''''+')';
     ExtSaldoDataSet.Database   :=TfrmSchSaldo(owner).WorkDatabase;
     ExtSaldoDataSet.Transaction:=TfrmSchSaldo(owner).ReadTransaction;
     ExtSaldoDataSet.Open;
end;

procedure TfrmExtSaldo.FormShow(Sender: TObject);
begin
     GetData;
end;

procedure TfrmExtSaldo.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmExtSaldo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmExtSaldo.EscExecute(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmExtSaldo.EnterExecute(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmExtSaldo.FormCreate(Sender: TObject);
begin
    WereChanges:=false;
    Caption:=Caption+' №'+TfrmSchSaldo(owner).SchTreeSaldoDataSet.FieldByName('SCH_NUMBER').AsString+' "'+
    TfrmSchSaldo(owner).SchTreeSaldoDataSet.FieldByName('SCH_TITLE').AsString+'"';
end;

procedure TfrmExtSaldo.ToolButton1Click(Sender: TObject);
var
     T:TfrmEditSaldo;
     UpdateSP: TpFibStoredProc;
begin
                 if (TfrmSchSaldo(owner).MBOOK_DATE<=TfrmSchSaldo(owner).ActualDate)
                 then begin
                            T:=TfrmEditSaldo.Create(self);

                            {Проверка периода когда редактируется сальдо счтеа}
                            if TfrmSchSaldo(owner).SchTreeSaldoDataSet.FieldByName('DATE_REC').AsDateTime=TfrmSchSaldo(owner).SchTreeSaldoDataSet.FieldByName('DATE_BEG').AsDateTime
                            then begin
                                       {Период когда счет был открыт}

                                       {Можна редактировать входящее сальдо}
                                       T.MAIN_DB_VALUE.Enabled:=true;
                                       T.MAIN_KR_VALUE.Enabled:=true;

                                       {Можна брать на балланс или снимать с балланса}
                                       T.DB_VALUE.Enabled:=true;
                                       T.KR_VALUE.Enabled:=true;
                            end
                            else begin
                                       {Счет был открыт в более ранний период}

                                       {Нельзя редактировать входящее сальдо}
                                       T.MAIN_DB_VALUE.Enabled:=false;
                                       T.MAIN_KR_VALUE.Enabled:=false;

                                       {Можна брать на балланс или снимать с балланса}
                                       T.DB_VALUE.Enabled:=true;
                                       T.KR_VALUE.Enabled:=true;
                            end;

                            if T.ShowModal=mrYes
                            then begin
                                       UpdateSP:=TpFibStoredProc.Create(self);
                                       UpdateSP.Database:=TfrmSchSaldo(owner).WorkDatabase;
                                       UpdateSP.Transaction:=TfrmSchSaldo(owner).WriteTransaction;
                                       TfrmSchSaldo(owner).WriteTransaction.StartTransaction;
                                       UpdateSP.StoredProcName:='PUB_DT_SCH_SALDO_PLUS_BALLANCE';
                                       UpdateSP.Prepare;
                                       UpdateSP.ParamByName('ID_SCH').Value       :=TfrmSchSaldo(owner).SchTreeSaldoDataSet.FieldByName('ID_SCH').Value;
                                       UpdateSP.ParamByName('DATE_REC').Value     :=TfrmSchSaldo(owner).ActualDate;
                                       UpdateSP.ParamByName('DB_DELTA_HAND').Value:=T.DB_VALUE.Text;
                                       UpdateSP.ParamByName('KR_DELTA_HAND').Value:=T.KR_VALUE.Text;
                                       UpdateSP.ExecProc;
                                       WereChanges:=true;
                                       TfrmSchSaldo(owner).WriteTransaction.Commit;
                                       GetData;
                                       UpdateSP.Free;
                            end;
                            T.Free;
                  end
                  else ShowMessage('Період закритий для змін');
end;

end.
