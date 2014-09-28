unit Emails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, IBase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase, cxContainer, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, cxClasses, cxTextEdit, cxSplitter,
  FIBDataSet, pFIBDataSet, cxHyperLinkEdit, pFibStoredProc, Accmgmt;

type
  TfrmUseEmail = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Styles: TcxStyleRepository;
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
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    PeriodsDataSet: TpFIBDataSet;
    PeriodsDataSource: TDataSource;
    Panel2: TPanel;
    cxCheckBox1: TcxCheckBox;
    Panel3: TPanel;
    ListGrid: TcxGrid;
    ListGridTabView: TcxGridDBTableView;
    TNColumn: TcxGridDBColumn;
    FIOColumn: TcxGridDBColumn;
    ListGridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    Panel4: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    Panel5: TPanel;
    Panel6: TPanel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    ValuesDataSet: TpFIBDataSet;
    ValuesDataSource: TDataSource;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FIdMan:Int64;
    constructor Create(AOwner:TComponent; dbhandle:TISC_DB_HANDLE;id_man:Int64);reintroduce;
  end;

implementation

uses EmailDates, EmailAddr, EmailProt;

{$R *.dfm}

constructor TfrmUseEmail.Create(AOwner: TComponent; dbhandle: TISC_DB_HANDLE; id_man:Int64);
var InfoDS:TpFibDataSet;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=dbhandle;
     ReadTransaction.StartTransaction;
     FIdMan:=id_man;
     PeriodsDataSet.SelectSQL.Text:='SELECT * FROM z_email_dates_sel('+IntToStr(FIdMan)+')';
     PeriodsDataSet.Open;

     ValuesDataSet.SelectSQL.Text:='SELECT * FROM z_email_addrs_sel(?id_email_date)';

     InfoDS:=TpFibDataSet.Create(self);
     InfoDS.Database:=WorkDatabase;
     InfoDS.SelectSQL.Text:='select * from z_tnaccess where id_man='+IntToStr(FIdMan);
     InfoDS.Open;
     if InfoDS.RecordCount>0
     then begin
               if InfoDS.FieldByName('use_email').Value='1'
               then cxCheckBox1.Checked:=true
               else cxCheckBox1.Checked:=false;
     end;
     InfoDS.Close;
     InfoDS.Free;


end;

procedure TfrmUseEmail.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmUseEmail.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmUseEmail.cxCheckBox1PropertiesChange(Sender: TObject);
var UpdSp:TpFibStoredProc;
begin
     UpdSp:=TpFibStoredProc.Create(self);
     UpdSp.Database:=WorkDatabase;
     UpdSp.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     UpdSp.StoredProcName:='Z_TNACCESS_UPD_ES';
     UpdSp.Prepare;
     UpdSp.ParamByName('id_man').asInt64:=FIdMan;
     UpdSp.ParamByName('use_email').value:=cxCheckBox1.Checked;
     UpdSp.ExecProc;
     UpdSp.Close;
     UpdSp.Free;
     WriteTransaction.Commit;
end;

procedure TfrmUseEmail.cxButton3Click(Sender: TObject);
var InsSP:TpFIBStoredProc;
    T:TfrmEmailDates;
    id_p:Integer;
    i:Integer;
    MaxDate:TDateTime;
    CopyFromBefore:Boolean;
    ExistPeriod:Boolean;
begin
     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailPeriodsConf','Add')<>0)
     then begin
               CopyFromBefore:=False;
               ExistPeriod:=False;
               T:=TfrmEmailDates.Create(self);

               if not PeriodsDataSet.Locate('DATE_END',StrToDate('31.12.9999'),[])
               then begin
                         MaxDate:=Date;
                         PeriodsDataSet.First;
                         for i:=0 to PeriodsDataSet.RecordCount-1 do
                         begin
                                ExistPeriod:=True;
                                if MaxDate<PeriodsDataSet.FieldByName('DATE_END').AsDateTime
                                then MaxDate:=PeriodsDataSet.FieldByName('DATE_END').AsDateTime;
                                PeriodsDataSet.Next;

                         end;

                         {if (MaxDate<>Date)
                         then begin
                                   if (MaxDate<StrToDate('31.12.9999'))
                                   then begin
                                             T.cxDateEdit1.Date:=MaxDate+1;
                                             T.cxDateEdit2.Date:=IncMonth(T.cxDateEdit1.Date,12)-1;
                                   end;
                         end;}

                         if T.ShowModal=mrYes
                         then begin
                                   if ExistPeriod
                                   then begin
                                             if (Application.MessageBox('Скопіювати зареєстровані адреси електронної пошти з попереднього періоду?','Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES)
                                             then begin
                                                       CopyFromBefore:=true;
                                             end;
                                   end;

                                   InsSP:=TpFIBStoredProc.Create(self);
                                   InsSP.Database:=WorkDatabase;
                                   InsSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   InsSP.StoredProcName:='Z_EMAIL_DATES_INS';
                                   InsSP.Prepare;
                                   InsSP.ParamByName('ID_MAN').asInt64:=FIdMan;
                                   InsSP.ParamByName('DATE_BEG').Value:=T.cxDateEdit1.Date;
                                   InsSP.ParamByName('DATE_END').Value:=T.cxDateEdit2.Date;
                                   InsSP.ParamByName('U_PASSWORD').Value:=T.cxTextEdit1.Text;
                                   InsSP.ParamByName('COPYFROMBEFORE').Value:=Integer(CopyFromBefore);
                                   InsSP.ExecProc;
                                   id_p:=InsSP.ParamByName('ID_EMAIL_DATE').Value;
                                   WriteTransaction.Commit;

                                   ListGrid.BeginUpdate;
                                   PeriodsDataSet.CloseOpen(true);
                                   PeriodsDataSet.Locate('ID_EMAIL_DATE',id_p,[]);
                                   ListGrid.EndUpdate;

                                   InsSP.Close;
                                   InsSP.Free;
                         end;
               end
               else ShowMessage('Спочатку треба обмежити строк періоду розсилання');
     end
     else ShowMessage('Ви не маєте доступу до цієї функції');
end;

procedure TfrmUseEmail.cxButton4Click(Sender: TObject);
var DelSP:TpFIBStoredProc;
begin
     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailPeriodsConf','Del')<>0)
     then begin
               if PeriodsDataSet.RecordCount>0
               then begin
                         if Application.MessageBox('Ви хочете видалити період?', 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
                         then begin
                                   DelSP:=TpFIBStoredProc.Create(self);
                                   DelSP.Database:=WorkDatabase;
                                   DelSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   DelSP.StoredProcName:='Z_EMAIL_DATES_DEL';
                                   DelSP.Prepare;
                                   DelSP.ParamByName('id_email_date').Value:=PeriodsDataSet.FieldByName('id_email_date').Value;
                                   DelSP.ExecProc;
                                   WriteTransaction.Commit;
                                   DelSP.Close;
                                   DelSP.Free;
                                   PeriodsDataSet.CacheDelete;
                         end;
               end;
     end
     else ShowMessage('Ви не маєте доступу до цієї функції');
end;

procedure TfrmUseEmail.cxButton5Click(Sender: TObject);
var T:TfrmEmailAddr;
    InsSP:TpFIBStoredProc;
    id_rec:Integer;
begin
     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailAddrConfigure','Add')<>0)
     then begin
               if (PeriodsDataSet.RecordCount>0)
               then begin
                         T:=TfrmEmailAddr.Create(Self,WorkDatabase.Handle,0);
                         if T.ShowModal=mrYes
                         then begin
                                   InsSP:=TpFIBStoredProc.Create(self);
                                   InsSP.Database:=WorkDatabase;
                                   InsSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   InsSP.StoredProcName:='Z_EMAIL_ADDRS_INS';
                                   InsSP.Prepare;
                                   InsSP.ParamByName('date_beg').Value:=T.cxDateEdit1.Date;
                                   InsSP.ParamByName('date_end').Value:=T.cxDateEdit2.Date;
                                   InsSP.ParamByName('id_email_date').Value:=PeriodsDataSet.FieldByName('id_email_date').Value;
                                   InsSP.ParamByName('email_value').Value:=T.cxButtonEdit1.Text;
                                   InsSP.ParamByName('id_man').AsInt64:=FIdMan;
                                   InsSP.ExecProc;
                                   id_rec:=InsSP.ParamByName('id_rec').Value;
                                   WriteTransaction.Commit;
                                   InsSP.Close;
                                   InsSP.Free;

                                   cxGrid1.BeginUpdate;
                                   ValuesDataSet.CloseOpen(true);
                                   ValuesDataSet.Locate('id_rec',id_rec,[]);
                                   cxGrid1.EndUpdate;
                         end;
                         T.Free;
               end;
     end
     else ShowMessage('Ви не маєте доступу до цієї функції');
end;

procedure TfrmUseEmail.cxButton6Click(Sender: TObject);
var DelSP:TpFIBStoredProc;
begin
     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailAddrConfigure','Del')<>0)
     then begin
               if (ValuesDataSet.RecordCount>0)
               then begin
                         if Application.MessageBox('Ви хочете видалити контакт для розсилки?', 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
                         then begin
                                   DelSP:=TpFIBStoredProc.Create(self);
                                   DelSP.Database:=WorkDatabase;
                                   DelSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   DelSP.StoredProcName:='Z_EMAIL_ADDRS_DEL';
                                   DelSP.Prepare;
                                   DelSP.ParamByName('id_rec').Value:=ValuesDataSet.FieldByName('id_rec').Value;
                                   DelSP.ExecProc;
                                   WriteTransaction.Commit;
                                   DelSP.Close;
                                   DelSP.Free;
                                   ValuesDataSet.CacheDelete;
                         end;
               end;
     end
     else ShowMessage('Ви не маєте доступу до цієї функції');

end;

procedure TfrmUseEmail.cxButton8Click(Sender: TObject);
var T:TfrmEmailAddr;
    InsSP:TpFIBStoredProc;
    id_rec:Integer;
begin
     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailAddrConfigure','Edit')<>0)
     then begin
               if (PeriodsDataSet.RecordCount>0)
               then begin
                         if (ValuesDataSet.RecordCount>0)
                         then begin
                                   T:=TfrmEmailAddr.Create(Self,WorkDatabase.Handle,0);
                                   T.cxButtonEdit1.Text:=ValuesDataSet.FieldByName('value_contact').AsString;
                                   T.cxDateEdit1.Date:=ValuesDataSet.FieldByName('date_beg').Value;
                                   T.cxDateEdit2.Date:=ValuesDataSet.FieldByName('date_end').Value;
                                   if T.ShowModal=mrYes
                                   then begin
                                             InsSP:=TpFIBStoredProc.Create(self);
                                             InsSP.Database:=WorkDatabase;
                                             InsSP.Transaction:=WriteTransaction;
                                             WriteTransaction.StartTransaction;
                                             InsSP.StoredProcName:='Z_EMAIL_ADDRS_UPD';
                                             InsSP.Prepare;
                                             InsSP.ParamByName('date_beg').Value:=T.cxDateEdit1.Date;
                                             InsSP.ParamByName('date_end').Value:=T.cxDateEdit2.Date;
                                             InsSP.ParamByName('id_email_date').Value:=PeriodsDataSet.FieldByName('id_email_date').Value;
                                             InsSP.ParamByName('id_people_contact').Value:=ValuesDataSet.FieldByName('id_people_contact').Value;
                                             InsSP.ParamByName('email_value').Value:=T.cxButtonEdit1.Text;
                                             InsSP.ParamByName('id_rec').Value:=ValuesDataSet.FieldByName('id_rec').Value;

                                             InsSP.ExecProc;
                                             WriteTransaction.Commit;
                                             InsSP.Close;
                                             InsSP.Free;

                                             cxGrid1.BeginUpdate;
                                             ValuesDataSet.CloseOpen(true);
                                             ValuesDataSet.Locate('id_rec',id_rec,[]);
                                             cxGrid1.EndUpdate;
                                   end;
                                   T.Free;
                         end;
               end;
     end
     else ShowMessage('Ви не маєте доступу до цієї функції');
end;

procedure TfrmUseEmail.cxButton7Click(Sender: TObject);
var T:TfrmEmailProtokol;
begin
     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailAddrConfigure','View')<>0)
     then begin
               if ValuesDataSet.RecordCount>0
               then begin
                         T:=TfrmEmailProtokol.Create(self,
                                                     WorkDatabase.Handle,
                                                     0,
                                                     ValuesDataSet.FieldByName('id_man').Value);
                         T.ShowModal;
                         T.Free;
               end;
     end
     else ShowMessage('Ви не маєте доступу до цієї функції');
end;

procedure TfrmUseEmail.cxButton9Click(Sender: TObject);
var InsSP:TpFIBStoredProc;
    T:TfrmEmailDates;
    id_p:Integer;
begin
     if not (fibCheckPermission('/ROOT/Zarplata/SentToEmail/MailPeriodsConf','Edit')<>0)
     then begin
               if (PeriodsDataSet.RecordCount>0)
               then begin
                         T:=TfrmEmailDates.Create(self);
                         if PeriodsDataSet.FieldByName('DATE_BEG').Value<>null
                         then T.cxDateEdit1.Date:=PeriodsDataSet.FieldByName('DATE_BEG').Value;

                         if PeriodsDataSet.FieldByName('DATE_END').Value<>null
                         then T.cxDateEdit2.Date:=PeriodsDataSet.FieldByName('DATE_END').Value;

                         if PeriodsDataSet.FieldByName('U_PASSWORD').Value<>null
                         then T.cxTextEdit1.Text:=PeriodsDataSet.FieldByName('U_PASSWORD').Value;

                         if T.ShowModal=mrYes
                         then begin
                                   InsSP:=TpFIBStoredProc.Create(self);
                                   InsSP.Database:=WorkDatabase;
                                   InsSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   InsSP.StoredProcName:='Z_EMAIL_DATES_UPD';
                                   InsSP.Prepare;
                                   id_p:=PeriodsDataSet.FieldByName('ID_EMAIL_DATE').Value;
                                   InsSP.ParamByName('ID_EMAIL_DATE').Value:=PeriodsDataSet.FieldByName('ID_EMAIL_DATE').Value;
                                   InsSP.ParamByName('DATE_BEG').Value:=T.cxDateEdit1.Date;
                                   InsSP.ParamByName('DATE_END').Value:=T.cxDateEdit2.Date;
                                   InsSP.ParamByName('U_PASSWORD').Value:=T.cxTextEdit1.Text;
                                   InsSP.ExecProc;

                                   WriteTransaction.Commit;

                                   ListGrid.BeginUpdate;
                                   PeriodsDataSet.CloseOpen(true);
                                   PeriodsDataSet.Locate('ID_EMAIL_DATE',id_p,[]);
                                   ListGrid.EndUpdate;

                                   InsSP.Close;
                                   InsSP.Free;
                         end;
               end;
     end
     else ShowMessage('Ви не маєте доступу до цієї функції');
end;

end.
