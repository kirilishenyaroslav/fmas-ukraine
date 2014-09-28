unit NdsProcentEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  ExtCtrls, Resources_unit, DB, FIBDataSet, pFIBDataSet, MainNdsProcent,
  FIBQuery, pFIBQuery, pFIBStoredProc;

resourcestring
    errTipDogNotDBeg = 'Введите начальную дату!';
    errTipDogNotDEnd = 'Введите конечную дату!';
    errTipDogNotDEnd_DBeg = 'Некорректно задан период!';


type
  TfrmNdsProcEdit = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    cxButton_ok: TcxButton;
    cxButton_cl: TcxButton;
    cxDateEdit_d_beg: TcxDateEdit;
    cxDateEdit_d_end: TcxDateEdit;
    cxMaskEdit_nds_proc: TcxMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pFIBDataSet_nds_proc_edit: TpFIBDataSet;
    pFIBStoredProc_nds_edit: TpFIBStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cxButton_clClick(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
  private
    { Private declarations }
  public
  constructor Create(Aowner: TComponent; id_nds_prosent :Variant; Flag :Boolean);overload;
    { Public declarations }
  end;

var
  frmNdsProcEdit: TfrmNdsProcEdit;
  Flag_edit: Boolean;
  id_nds: Variant;

implementation

{$R *.dfm}

constructor TfrmNdsProcEdit.Create(Aowner: TComponent; id_nds_prosent :Variant; Flag :Boolean);
begin
if Flag=true then
  begin
    inherited Create (Aowner);
    pFIBDataSet_nds_proc_edit.Database:=TfrmNdsProcent(Self.Owner).pFIBDatabase;
    pFIBDataSet_nds_proc_edit.Transaction:=TfrmNdsProcent(Self.Owner).pFIBTransactionRead;
    pFIBDataSet_nds_proc_edit.Active:=false;
    pFIBDataSet_nds_proc_edit.ParamByName('param_nds_proc').Value:=id_nds_prosent;
    pFIBDataSet_nds_proc_edit.Active:=true;
    cxDateEdit_d_beg.Text:=pFIBDataSet_nds_proc_edit.FieldByName('D_BEG').AsString;
    cxDateEdit_d_end.Text:=pFIBDataSet_nds_proc_edit.FieldByName('D_END').AsString;
    cxMaskEdit_nds_proc.Text:=pFIBDataSet_nds_proc_edit.FieldByName('NDS_PROCENT').AsString;
    id_nds:=pFIBDataSet_nds_proc_edit.FieldByName('ID_NDS_PROCENT').AsVariant;
    Flag_edit:=Flag;
  end
  else
  begin
    inherited Create (Aowner);
    Flag_edit:=Flag;
  end;
end;

procedure TfrmNdsProcEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmNdsProcEdit.FormCreate(Sender: TObject);
begin
  //Интерфейс
  Label1.Caption:=Resources_unit.DT_DATE_BEG;
  Label2.Caption:=Resources_unit.DT_DATE_END;
  Label3.Caption:=Resources_unit.DT_NDS_PROC;
  cxButton_ok.Caption:=Resources_unit.PUB_BUTTON_OK_CONST;
  cxButton_cl.Caption:=Resources_unit.PUB_BUTTON_CANCEL_CONST;
end;

procedure TfrmNdsProcEdit.cxButton_clClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNdsProcEdit.cxButton_okClick(Sender: TObject);
begin
        // проверка на заполнение даты
    if  Trim(cxDateEdit_d_beg.Text)='' then
        begin
        MessageDlg(errTipDogNotDBeg, mtError, [mbOk], 0);
        cxDateEdit_d_beg.SetFocus;
        Exit;
    end;

        // проверка на заполнение даты
    if  Trim(cxDateEdit_d_end.Text)='' then
        begin
        MessageDlg(errTipDogNotDEnd, mtError, [mbOk], 0);
        cxDateEdit_d_end.SetFocus;
        Exit;
    end;

        // проверка на корректность даты
    if  cxDateEdit_d_beg.Date>cxDateEdit_d_end.Date then
        begin
        MessageDlg(errTipDogNotDEnd_DBeg, mtError, [mbOk], 0);
        cxDateEdit_d_beg.SetFocus;
        Exit;
    end;

    if Flag_edit=false then
    begin
      pFIBStoredProc_nds_edit.Database:=TfrmNdsProcent(Self.Owner).pFIBDatabase;
      pFIBStoredProc_nds_edit.Transaction:=TfrmNdsProcent(Self.Owner).pFIBTransactionWrite;
      TfrmNdsProcent(Self.Owner).pFIBTransactionWrite.DefaultDatabase:=TfrmNdsProcent(Self.Owner).pFIBDatabase;
      TfrmNdsProcent(Self.Owner).pFIBTransactionWrite.StartTransaction;
      pFIBStoredProc_nds_edit.StoredProcName:='PUB_NDS_PROCENT_INSERT';
      pFIBStoredProc_nds_edit.ParamByName('D_D_BEG').Value:=cxDateEdit_d_beg.Text;
      pFIBStoredProc_nds_edit.ParamByName('D_D_END').Value:=cxDateEdit_d_end.Text;
      pFIBStoredProc_nds_edit.ParamByName('D_NDS_PROCENT').Value:=cxMaskEdit_nds_proc.Text;
      try
        pFIBStoredProc_nds_edit.ExecProc;
      except
        begin
          TfrmNdsProcent(Self.Owner).pFIBTransactionWrite.Commit;
          Exit;
        end;
      end;
        TfrmNdsProcent(Self.Owner).pFIBTransactionWrite.Rollback;
        Close;
    end
    else
    begin
      pFIBStoredProc_nds_edit.Database:=TfrmNdsProcent(Self.Owner).pFIBDatabase;
      pFIBStoredProc_nds_edit.Transaction:=TfrmNdsProcent(Self.Owner).pFIBTransactionWrite;
      TfrmNdsProcent(Self.Owner).pFIBTransactionWrite.DefaultDatabase:=TfrmNdsProcent(Self.Owner).pFIBDatabase;
      TfrmNdsProcent(Self.Owner).pFIBTransactionWrite.StartTransaction;
      pFIBStoredProc_nds_edit.StoredProcName:='PUB_NDS_PROCENT_UPDATE';
      pFIBStoredProc_nds_edit.ParamByName('D_ID_NDS_PROCENT').Value:=id_nds;
      pFIBStoredProc_nds_edit.ParamByName('D_D_BEG').Value:=cxDateEdit_d_beg.Text;
      pFIBStoredProc_nds_edit.ParamByName('D_D_END').Value:=cxDateEdit_d_end.Text;
      pFIBStoredProc_nds_edit.ParamByName('D_NDS_PROCENT').Value:=cxMaskEdit_nds_proc.Text;
      try
        pFIBStoredProc_nds_edit.ExecProc;
      except
        begin
          TfrmNdsProcent(Self.Owner).pFIBTransactionWrite.Commit;
          Exit;
        end;
      end;
        TfrmNdsProcent(Self.Owner).pFIBTransactionWrite.Rollback;
        Close;
    end;
end;

end.




