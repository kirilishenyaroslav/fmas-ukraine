unit uFormUch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, ibase, cxDropDownEdit, cxMaskEdit, cxCalendar, cxDBEdit,
  cxContainer, cxTextEdit, cxSplitter, cxCheckBox, cxLabel, uWate;

type
  TRegUchForm = class(TForm)
    pnl1: TPanel;
    pnl3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    ds1: TDataSource;
    SP: TpFIBStoredProc;
    TR: TpFIBTransaction;
    DSID_FORM_UCH: TFIBBCDField;
    DSDATE_REC: TFIBDateField;
    DSID_REG: TFIBBCDField;
    DSIS_VALYUTA: TFIBIntegerField;
    DSID_SYS: TFIBStringField;
    DSGRP_DOG_STUD: TFIBIntegerField;
    DSGRP_DOG_KONTR: TFIBIntegerField;
    DSTYPE_DOC: TFIBIntegerField;
    DSNOT_PRINT_FIO_ISPOLN: TFIBIntegerField;
    DSTYPE_DOC_VAL: TFIBIntegerField;
    DSKASS_DAY: TFIBIntegerField;
    DSFORM_UCH: TFIBStringField;
    DSREG_TITLE: TFIBStringField;
    DSREG_SHORT: TFIBStringField;
    DSROZSH: TFIBStringField;
    DSSYSTEM: TFIBStringField;
    DST_DOC: TFIBStringField;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cxFormUch: TcxComboBox;
    lbl5: TLabel;
    cxRozsh: TcxComboBox;
    cxReg_uch: TcxTextEdit;
    cxReg_short: TcxTextEdit;
    cxPeriod: TcxDateEdit;
    cxIspolnit: TcxCheckBox;
    cxKassDay: TcxCheckBox;
    lbl6: TLabel;
    cxDocFull: TcxTextEdit;
    lbl7: TLabel;
    cxDocShort: TcxTextEdit;
    DST_FULL: TFIBStringField;
    cxAdd: TcxButton;
    cxEdit: TcxButton;
    cxDel: TcxButton;
    cxExit: TcxButton;
    cxButton1: TcxButton;
    procedure FormResize(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxFormUchPropertiesChange(Sender: TObject);
    procedure cxExitClick(Sender: TObject);
    procedure cxAddClick(Sender: TObject);
    procedure cxEditClick(Sender: TObject);
    procedure cxDelClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DBHANDLE: TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

var
  RegUchForm: TRegUchForm;

implementation
  uses uQuest;
{$R *.dfm}
constructor TRegUchForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);
var id:Integer;
begin
 inherited Create(AOwner);
  if Assigned(DBHandle)
  then begin
   Self.DBHANDLE := DBHandle;
   Self.DB.Close;
   Self.DB.Handle:=DBHANDLE;
   Self.DB.Open;

   Self.DS.Close;

   Self.DS.SelectSQL.Clear;
   Self.DS.SelectSQL.Add('SELECT * FROM PC_SELECT_ALL_ABOUT_UCH order by form_uch');
   Self.DS.CloseOpen(false);
   Self.DS.FetchAll;
   Self.DS.First;
   id:=Self.DSID_REG.AsInteger;
   DS.Locate('ID_REG', id, []);
   cxGrid1DBTableView1.ViewData.Expand(true);

  end;
end;

procedure TRegUchForm.FormResize(Sender: TObject);
begin
 pnl1.Left := (Width - pnl1.Width - 7) div 2;
 pnl1.Top  := (Height - pnl1.Height - 38) div 2;
end;

procedure TRegUchForm.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if DSSYSTEM.AsString = 'Контракти' then begin cxFormUch.ItemIndex:=0; cxRozsh.ItemIndex:=0; end;
 if DSSYSTEM.AsString = 'Контракти (валюта)' then begin cxFormUch.ItemIndex:=1; cxRozsh.ItemIndex:=1; end;
 if DSSYSTEM.AsString = 'Студмістечко' then begin cxFormUch.ItemIndex:=2; cxRozsh.ItemIndex:=0; end;
 cxReg_uch.Text:=DSREG_TITLE.AsString;
 cxReg_short.Text:=DSREG_SHORT.AsString;
 cxPeriod.EditValue:=DSDATE_REC.AsDateTime;
 if DSNOT_PRINT_FIO_ISPOLN.value=1 then cxIspolnit.Checked:=False else cxIspolnit.Checked:=True;
 if DSKASS_DAY.value=1 then cxKassDay.Checked:=True else cxKassDay.Checked:=False;
 cxDocFull.Text:=DST_FULL.AsString;
 cxDocShort.Text:=DST_DOC.AsString;
end;

procedure TRegUchForm.cxFormUchPropertiesChange(Sender: TObject);
begin
 if ((cxFormUch.ItemIndex=0) or (cxFormUch.ItemIndex=2)) then cxRozsh.ItemIndex:=0;
 if cxFormUch.ItemIndex =1 then cxRozsh.ItemIndex:=1; 
end;

procedure TRegUchForm.cxExitClick(Sender: TObject);
begin
close;
end;

procedure TRegUchForm.cxAddClick(Sender: TObject);
var form:TQuestForm;
    wate:TWateForm;
begin
 form:=TQuestForm.Create(Self);
 form.lbl1.Caption:='Ви дійсно бажаєте додати регістр обліку';
 form.lbl2.Caption:='із заданими параметрами?';
 form.ShowModal;
 if form.ModalResult=mrOk then
 begin
   form.Free;
   wate:= TWateForm.Create(Self);
   wate.Show;
   wate.Update;
 try
 SP.Close;
 SP.Transaction := Tr;
 SP.Transaction.StartTransaction;
 SP.StoredProcName:='PC_ADD_REG_UCH';
 SP.Prepare;
 SP.ParamByName('REG_TITLE').AsString:=cxReg_uch.Text;
 SP.ParamByName('REG_SHORT').AsString:=cxReg_short.Text;
 if cxFormUch.ItemIndex = 2 then
 SP.ParamByName('ID_FORM_UCH').AsInteger:=19 else SP.ParamByName('ID_FORM_UCH').AsInteger:=20;
 SP.ParamByName('DATE_REC').AsDate:=cxPeriod.EditValue;
 if cxFormUch.ItemIndex = 1 then SP.ParamByName('IS_VALYUTA').AsInteger:=1 else SP.ParamByName('IS_VALYUTA').AsInteger:=0;
 if cxFormUch.ItemIndex = 0 then SP.ParamByName('ID_SYS').AsString:='CONTR';
 if cxFormUch.ItemIndex = 1 then SP.ParamByName('ID_SYS').AsString:='CONTR_VAL';
 if cxFormUch.ItemIndex = 2 then SP.ParamByName('ID_SYS').AsString:='STUD_CITY';
 if cxIspolnit.Checked = False then SP.ParamByName('NOT_PRINT_FIO_ISPOLN').AsInteger:=1 else SP.ParamByName('NOT_PRINT_FIO_ISPOLN').AsInteger:=0;
 if cxKassDay.Checked = True then SP.ParamByName('KASS_DAY').AsInteger:=1 else SP.ParamByName('KASS_DAY').AsInteger:=0;
 SP.ParamByName('T_DOC').AsString:=cxDocShort.Text;
 SP.ParamByName('T_FULL').AsString:=cxDocFull.Text;
 SP.ExecProc;
 SP.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  SP.Transaction.Rollback;
  exit;
    end;
 end;
 wate.Free;
 end;
 DS.CloseOpen(False);
 cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TRegUchForm.cxEditClick(Sender: TObject);
var form:TQuestForm;
    wate:TWateForm;
begin
 form:=TQuestForm.Create(Self);
 form.lbl1.Caption:='Ви дійсно бажаєте змінити регістр обліку';
 form.lbl2.Caption:='із заданими параметрами?';
 form.ShowModal;
 if form.ModalResult=mrOk then
 begin
   form.Free;
   wate:= TWateForm.Create(Self);
   wate.Show;
   wate.Update;
 try
 SP.Close;
 SP.Transaction := Tr;
 SP.Transaction.StartTransaction;
 SP.StoredProcName:='PC_EDIT_REG_UCH';
 SP.Prepare;
 SP.ParamByName('ID_REG').AsInteger:=DSID_REG.AsInteger;
 SP.ParamByName('REG_TITLE').AsString:=cxReg_uch.Text;
 SP.ParamByName('REG_SHORT').AsString:=cxReg_short.Text;
 if cxFormUch.ItemIndex = 2 then
 SP.ParamByName('ID_FORM_UCH').AsInteger:=19 else SP.ParamByName('ID_FORM_UCH').AsInteger:=20;
 SP.ParamByName('DATE_REC').AsDate:=cxPeriod.EditValue;
 if cxFormUch.ItemIndex = 1 then SP.ParamByName('IS_VALYUTA').AsInteger:=1 else SP.ParamByName('IS_VALYUTA').AsInteger:=0;
 if cxFormUch.ItemIndex = 0 then SP.ParamByName('ID_SYS').AsString:='CONTR';
 if cxFormUch.ItemIndex = 1 then SP.ParamByName('ID_SYS').AsString:='CONTR_VAL';
 if cxFormUch.ItemIndex = 2 then SP.ParamByName('ID_SYS').AsString:='STUD_CITY';
 if cxIspolnit.Checked = False then SP.ParamByName('NOT_PRINT_FIO_ISPOLN').AsInteger:=1 else SP.ParamByName('NOT_PRINT_FIO_ISPOLN').AsInteger:=0;
 if cxKassDay.Checked = True then SP.ParamByName('KASS_DAY').AsInteger:=1 else SP.ParamByName('KASS_DAY').AsInteger:=0;
 SP.ParamByName('T_DOC').AsString:=cxDocShort.Text;
 SP.ParamByName('T_FULL').AsString:=cxDocFull.Text;
 SP.ExecProc;
 SP.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  SP.Transaction.Rollback;
  exit;
    end;
 end;
 wate.Free;
 end;
 DS.CloseOpen(False);
 cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TRegUchForm.cxDelClick(Sender: TObject);
var form:TQuestForm;
    wate:TWateForm;
begin
 form:=TQuestForm.Create(Self);
 form.lbl1.Caption:='Ви дійсно бажаєте видалити регістр обліку?';
 form.lbl2.Caption:='';
 form.ShowModal;
 if form.ModalResult=mrOk then
 begin
   form.Free;
   wate:= TWateForm.Create(Self);
   wate.Show;
   wate.Update;
 try
 SP.Close;
 SP.Transaction := Tr;
 SP.Transaction.StartTransaction;
 SP.StoredProcName:='PC_DEL_REG_UCH';
 SP.Prepare;
 SP.ParamByName('ID_REG').AsInteger:=DSID_REG.AsInteger;
 SP.ExecProc;
 SP.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  SP.Transaction.Rollback;
  exit;
    end;
 end;
 wate.Free;
 end;
 DS.CloseOpen(False);
 cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TRegUchForm.cxButton1Click(Sender: TObject);
begin
 DS.CloseOpen(False);
 cxGrid1DBTableView1.ViewData.Expand(true);
end;

procedure TRegUchForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
